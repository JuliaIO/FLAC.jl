"""
Metadata in a FLAC stream.

Used in both encoding and decoding of a stream.
Each type of metadata object contains an indicator
of its `typ`, an indicator of whether this is the
last metadata block and its length, in bytes.
"""
abstract type StreamMetaData end

@enum(MetaDataType,
      Info,
      Padding,
      Application,
      SeekTable,
      VorbisComment,
      CueSheet,
      Picture)

@enum(PictureType,
      Other,
      FileIconStandard,
      FileIcon,
      FrontCover,
      BackCover,
      LeafletPage,
      Media,
      LeadArtist,
      Artist,
      Conductor,
      Band,
      Composer,
      Lyricist,
      RecordingLocation,
      DuringRecording,
      DuringPerformance,
      VideoScreenCapture,
      Fish,                             # ?
      Illustration,
      BandLogo,
      PublisherLogo,
      Undefined)

"""
A block containing information on the stream including
`samplerate`, `channels`, `bitspersample`, `totalsamples`,
and `mdsum`.
"""
mutable struct InfoMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    minblocksize::Int32
    maxblocksize::Int32
    minframesize::Int32
    maxframesize::Int32
    samplerate::Int32
    channels::Int32
    bitspersample::Int32
    totalsamples::Int64
    md5sum::NTuple{16,UInt8}
    InfoMetaData() =
        new(Info, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, tuple(fill(0x00, 16)...))
end

"""
`len` bytes of padding in the FLAC stream.
"""
mutable struct PaddingMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    dummy::Cint
end

"""
Application metadata

Not sure what this is for.
"""
mutable struct ApplicationMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    id::NTuple{4, Char}
    data::Ptr{Cvoid}
end

struct SeekPoint
    sample_number::Int64
    stream_offset::Int64
    frame_samples::UInt32
end

"""
An array of `SeekPoint`s
"""
mutable struct SeekTableMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    num_points::UInt32
    points::Ptr{SeekPoint}
end


"""
A single Vorbis comment.

Comments are usually key/value pairs of the form
`ARTIST=Miles Davis`, `YEAR=1965`, etc.
"""
struct VorbisCommentEntry
    len::UInt32
    entry::Ptr{UInt8}
end

"""
Vorbis comment metadata.  The vendor comment is always present.
"""
mutable struct VorbisCommentMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Cuint
    vendor::VorbisCommentEntry
    n::UInt32
    comments::Ptr{VorbisCommentEntry}
end

"""
A single cue sheet index
"""
struct CueSheetIndex
    offset::UInt64
    number::UInt8
end

"""
A single track annotation in a CueSheet.

I'm not sure about the offsets here.  In the C struct the `typ` and `pre_emphasis` fields
are single bits.
"""
struct CueSheetTrack
    offset::Int64
    number::UInt8
    isrc::NTuple{13, UInt8}
    typ::Cuint
#    pre_emphasis::Cuint
    num_indices::UInt8
    indices::Ptr{CueSheetIndex}
end

CueSheetTrack() = unsafe_load((:FLAC__StreamMetadata_CueSheet_Track, libflac),
                              Ptr{CueSheetTrack}, (Cvoid,))

"""
Cue sheet meta data.

An array of `CueSheetTrack`s
"""
mutable struct CueSheetMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    media_catalog_number::NTuple{129,UInt8}
    lead_in::Int64
    is_cd::Cint
    num_tracks::Cuint
    tracks::Ptr{CueSheetTrack}
end

mutable struct PictureMetaData <: StreamMetaData
    typ::MetaDataType
    is_last::Cint
    len::Int64
    ptyp::PictureType
    mime_type::Ptr{UInt8}
    description::Ptr{UInt8}
    width::UInt32
    height::UInt32
    depth::UInt32
    color::UInt32
    data_length::UInt32
    data::Ptr{UInt8}
end

const MDTypes = DataType[InfoMetaData, PaddingMetaData, ApplicationMetaData,
                         SeekTableMetaData, VorbisCommentMetaData,
                         CueSheetMetaData, PictureMetaData];

# Zero-argument external constructors for the metadata types.
#
# The finalizer is added because the memory is allocated by libflac
# The first metadatatype, InfoMetaData, is skipped because it has an internal
# zero-argument constructor.  This has the happy side-effect of aligning the tags
# with the integer values of the MetaDataType.

for (ind,typ) in enumerate(MDTypes[2:end])
    @eval begin
        $(Symbol(typ))() =
            unsafe_load(ccall((:FLAC__metadata_object_new, libflac),
                              Ptr{$typ}, (MetaDataType,), MetaDataType($ind)))
    end
end

"""
Factory to construct a subtype of StreamMetaData from an opaque pointer.

Typically this is used in a callback function that is passed a `Ptr{Cvoid}`.
"""
metadata(pt::Ptr{StreamMetaData}) =
    unsafe_load(convert(Ptr{MDTypes[unsafe_load(convert(Ptr{Int32}, pt)) + 1]}, pt))

## Specific constructors from file names
"""
Open the file, `fnm`, check that it is a flac stream and return any cue sheets, closing the file.
"""
function CueSheetMetaData(fnm::String)
    isfile(fnm) || throw(ArgumentError(string("\"",fnm, "\" is not a path to a readable file")))
    cue = Ptr{CueSheetMetaData}[C_NULL]
    ccall((:FLAC__metadata_get_cuesheet, libflac), Bool,
          (Ptr{UInt8}, Ptr{Ptr{CueSheetMetaData}}),
          fnm, cue) || error("call to get_cuesheet failed")
    unsafe_load(cue[1])
end

"""
Open the file, `fnm`, check that it is a flac stream and return the stream info, closing the file.
"""
function InfoMetaData(fnm::String)
    isfile(fnm) || throw(ArgumentError(string("\"",fnm, "\" is not a path to a readable file")))
    strinf = InfoMetaData()
    ccall((:FLAC__metadata_get_streaminfo,libflac), Bool,
          (Ptr{UInt8}, Ref{InfoMetaData}), fnm, strinf) || error("call to get_streaminfo failed")
    strinf
end

"""
Open the file, `fnm`, check that it is a flac stream and return any Vorbis tags, closing the file.
"""
function VorbisCommentMetaData(fnm::String)
    isfile(fnm) || throw(ArgumentError(string("\"",fnm, "\" is not a path to a readable file")))
    vorb = Ptr{VorbisCommentMetaData}[C_NULL]
    ccall((:FLAC__metadata_get_tags, libflac), Bool,
          (Ptr{UInt8}, Ptr{Ptr{VorbisCommentMetaData}}),
          fnm, vorb) || error("call to get_tags failed")
    unsafe_load(vorb[1])
end

"""
Create a Ptr{StreamMetaData} from a Dict of key/value pairs.

Both the key and the value are converted to strings.
"""
function Base.convert(::Type{Ptr{StreamMetaData}}, dd::Dict{K,V}) where {K,V}
    vcp = ccall((:FLAC__metadata_object_new, libflac),
                Ptr{StreamMetaData}, (MetaDataType, ), VorbisComment)
    for (k, v) in dd
        kk = string(k)
        vv = string(v)
        ccall((:FLAC__format_vorbiscomment_entry_name_is_legal, libflac), Bool,
              (Ptr{UInt8},Cuint), kk, length(kk)) ||
              error(string("\"",k, "\" is not a legal Vorbis comment name"))
        ccall((:FLAC__format_vorbiscomment_entry_value_is_legal, libflac), Bool,
              (Ptr{UInt8},Cuint), vv, -one(Cuint))||
              error(string("\"",v,"\" is not a legal Vorbis comment value"))
        ce = [VorbisCommentEntry(0, C_NULL)]
        ccall((:FLAC__metadata_object_vorbiscomment_entry_from_name_value_pair, libflac),
              Bool, (Ptr{VorbisCommentEntry}, Ptr{UInt8}, Ptr{UInt8}),
              ce, kk, vv) || error("failure to create vorbiscomment with key $k and value $v")
        ccall((:FLAC__metadata_object_vorbiscomment_append_comment, libflac), Bool,
              (Ptr{StreamMetaData}, VorbisCommentEntry, Bool),
              vcp, ce[1], true) || error("failure to append vorbiscomment with key $k and value $v")
    end
    vcp
end

function Base.convert(::Type{Dict}, vc::VorbisCommentMetaData)
    dd = Dict{String, String}()
    dd["vendor"] = string(vc.vendor)
    for e in unsafe_wrap(Vector{FLAC.VorbisCommentMetaData}, vc.comments, vc.n)
        k = Ptr{UInt8}[C_NULL]
        v = Ptr{UInt8}[C_NULL]
        ccall((:FLAC__metadata_object_vorbiscomment_entry_to_name_value_pair, libflac),
              Bool, (VorbisCommentEntry, Ptr{Ptr{UInt8}}, Ptr{Ptr{UInt8}}),
              e, k, v) || error("failure in entry_to_name_value_pair")
        dd[unsafe_string(k[1])] = unsafe_string(v[1])
    end
    dd
end

## show methods for various types of StreamMetaData

function Base.show(io::IO, ib::InfoMetaData)
    ib.typ == Info || error("StreamInfoMetaData must have typ == $InfoType")
    println(io,"StreamInfo metadata block")
    println(io," is_last ", ib.is_last)
    println(io," len ", ib.len)
    println(io," minblocksize: ", ib.minblocksize)
    println(io," maxblocksize: ", ib.maxblocksize)
    println(io," minframesize: ", ib.minframesize)
    println(io," maxframesize: ", ib.maxframesize)
    println(io," samplerate: ", ib.samplerate)
    println(io," channels: ", ib.channels)
    println(io," bitspersample: ", ib.bitspersample)
    println(io," totalsamples: ", ib.totalsamples)
    println(io," md5sum: ", ib.md5sum)
    println(io)
end


function Base.show(io::IO, pb::PaddingMetaData)
    pb.typ == Padding || error("PaddingMetaData object's typ must be $PaddingType")
    println(io, "Flac stream padding metadata of length ", pb.len, " bytes.")
    println(io)
end

function Base.show(io::IO, st::SeekTableMetaData)
    st.typ == SeekTable || error("SeekTableType object's typ must be $SeektableType")
    println(io, "Flac seek table metadata of length ", st.len, " bytes with ",
            st.num_points, " points.")
    pts = unsafe_wrap(convert(Ptr{SeekPoint}, st.points), st.num_points)
    println(io, pts)
end

Base.string(e::VorbisCommentEntry) = unsafe_string(e.entry, e.len)

Base.show(io::IO,e::VorbisCommentEntry) = println(io, string(e.entry))

function Base.show(io::IO,c::VorbisCommentMetaData)
    c.typ == VorbisComment || error("VorbisCommentMetaData's typ must be $VorbisComment")
    println(io,"vendor=", string(c.vendor))
    for cc in unsafe_wrap(Vector{VorbisCommentEntry}, c.comments, c.n)
        println(io, string(cc))
    end
end
