@doc "Metadata for a flac stream object - either read or write"->
abstract StreamMetaData

@enum MetadataType InfoType=0 PaddingType=1 ApplicationType=2 SeektableType=3 VorbisCommentType=4 CueSheetType=5 PictureType=6

type StreamInfoMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    minblocksize::Int32
    maxblocksize::Int32
    minframesize::Int32
    maxframesize::Int32
    samplerate::Int32
    channels::Int32
    bitspersample::Int32
    totalsamples::Int64
    md5sum::NTuple{16,UInt8}
end

function Base.show(io::IO, ib::StreamInfoMetaData)
    ib.typ == InfoType || error("StreamInfoMetaData must have typ == $InfoType")
    println("StreamInfo metadata block")
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
    println(io)
end

##Create a stream info metadata object.  It may be better to do this
##within julia so there is no conflict about who owns the memory
StreamInfoMetaData() = unsafe_load(ccall((:FLAC__metadata_object_new,flac),
                                         Ptr{StreamInfoMetaData},(MetadataType,),InfoType))

## Create a StreamInfoMetaData object from an opaque pointer passed to a callback function.
function StreamInfoMetaData(ptr::Ptr{Void})
    rr = unsafe_load(reinterpret(Ptr{StreamInfoMetaData},ptr))
    rr.typ == InfoType || error("ptr must point to a InfoType StreamMetaData object")
    rr
end

## Open the file, `fnm`, check that it is a flac stream and return the stream info, closing the file.
function StreamInfoMetaData(fnm::ByteString)
    strinf = StreamInfoMetaData()
    ccall((:FLAC__metadata_get_streaminfo,flac),Bool,
          (Ptr{Uint8},Ref{StreamInfoMetaData}),fnm,strinf) || error("call to get_streaminfo failed")
    strinf
end

@doc """
Denotes a number of bytes of padding in the flac stream.
"""->
immutable StreamPaddingMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
end

function StreamPaddingMetaData(ptr::Ptr{Void})
    rr = unsafe_load(reinterpret(Ptr{StreamPaddingMetaData},ptr))
    rr.typ == PaddingType || error("ptr must point to a PaddingType StreamMetaData object")
    rr
end

function Base.show(io::IO, pb::StreamPaddingMetaData)
    pb.typ == PaddingType || error("StreamPaddingMetaData object's typ must be $PaddingType")
    println(io, "Flac stream padding metadata of length ", pb.len, " bytes.")
    println(io)
end

immutable StreamApplicationMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    id::NTuple{4,UInt8}
    data::Ptr{UInt8}
end

immutable SeekPoint
    sample_number::UInt64
    stream_offset::UInt64
    frame_samples::Cuint
end

immutable StreamSeekTableMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    num_points::Cuint
    points::Ptr{SeekPoint}
end

@doc """
A single vorbis comment.
"""->
immutable VorbisCommentEntry
    len::UInt32
    entry::Ptr{UInt8}
end

Base.show(io::IO,e::VorbisCommentEntry) = println(io, bytestring(e.entry,e.len))

@doc """
Vorbis comment metadata.  The vendor comment is always present.
"""->
type StreamVorbisCommentMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    vendor::VorbisCommentEntry
    n::UInt32
    comments::Ptr{VorbisCommentEntry}
end

StreamVorbisCommentMetaData() =  unsafe_load(ccall((:FLAC__metadata_object_new,flac),
                                                   Ptr{StreamVorbisCommentMetaData},
                                                   (MetadataType,),VorbisCommentType))


function StreamVorbisCommentMetaData(ptr::Ptr{Void})
    rr = unsafe_load(reinterpret(Ptr{StreamVorbisCommentMetaData},ptr))
    rr.typ == VorbisCommentType || error("ptr must point to a VorbisComment StreamMetaData object")
    rr
end

function Base.show(io::IO,c::StreamVorbisCommentMetaData)
    show(io,c.vendor)
    for cc in pointer_to_array(c.comments,c.n)
        show(io,cc)
    end
    println(io)
end

function StreamVorbisCommentMetaData(fnm::ByteString)
    vv = [Ptr{StreamVorbisCommentMetaData}(C_NULL);]
    ccall((:FLAC__metadata_get_tags,flac),Bool,
          (Ptr{UInt8},Ptr{Ptr{StreamVorbisCommentMetaData}}),fnm,vv) && return unsafe_load(vv[1])
    StreamVorbisCommentMetaData()
end
    
immutable CueSheetIndex
    offset::UInt64
    number::UInt8
end

@doc """
A single track annotation in a CueSheet.
I'm not sure about the offsets here.  In the C struct the `type` and `pre_emphasis` fields
are single bits.
"""->
immutable CueSheetTrack
    offset::Int64
    number::UInt8
    isrc::NTuple{13,UInt8}
    typ::Cuint
#    pre_emphasis::Cuint
    num_indices::UInt8
    indices::Ptr{CueSheetIndex}
end

CueSheetTrack() = unsafe_load((:FLAC__StreamMetadata_CueSheet_Track,flac),
                              Ptr{CueSheetTrack},(Void,))
                              
@doc """
Cue sheet meta data
"""->
type StreamCueSheetMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    media_catalog_number::NTuple{129,UInt8}
    lead_in::Int64
    is_cd::Bool
    num_tracks::Cuint
    tracks::Ptr{CueSheetTrack}
end

StreamCueSheetMetaData() = unsafe_load(ccall((:FLAC__metadata_object_new,flac),
                                             Ptr{StreamCueSheetMetaData},
                                             (MetadataType,),CueSheetType))

function StreamCueSheetMetaData(fnm::ByteString)
    vv = [Ptr{StreamCueSheetMetaData}(C_NULL);]
    ccall((:FLAC__metadata_get_cuesheet,flac),Bool,
          (Ptr{UInt8},Ptr{Ptr{StreamCueSheetMetaData}}),fnm,vv) && return unsafe_load(vv[1])
    StreamCueSheetMetaData()
end

