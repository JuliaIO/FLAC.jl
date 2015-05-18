abstract StreamMetaData

@enum MetadataType InfoType=0 PaddingType=1 ApplicationType=2 SeektableType=3 VorbisCommentType=4 CuesheetType=5 PictureType=6

immutable StreamInfoMetaData <: StreamMetaData
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
end

immutable StreamPaddingMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
end

immutable StreamApplicationMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    id::NTuple{4,Char}
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

immutable VorbisCommentEntry
    len::UInt32
    entry::Ptr{UInt8}
end

Base.show(io::IO,e::VorbisCommentEntry) = 
    println(io, bytestring(e.entry,e.len))

immutable StreamVorbisCommentMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    vendor::VorbisCommentEntry
    n::UInt32
    comments::Ptr{VorbisCommentEntry}
end

immutable CueSheetIndex
    offset::UInt64
    number::UInt8
end

immutable StreamCueSheetMetaData <: StreamMetaData
    typ::MetadataType
    is_last::Bool
    len::Cuint
    offset::UInt64
    number::UInt8
    isrc::NTuple{13,Char}
    ## Will need to explore 
end

function Base.show(io::IO, ib::StreamInfoMetaData)
    println("StreamInfo metadata block")
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


function Base.show(io::IO,c::StreamVorbisCommentMetaData)
    show(io,c.vendor)
    for cc in pointer_to_array(c.comments,c.n)
        show(io,cc)
    end
    println(io)
end

@doc "standard metadata callback function" ->
function mcallback(d::Ptr{Void}, mp::Ptr{Int32}, client::Ptr{Void})
    gv = pointer_to_array(mp,3)
    show(gv)
    println()
    println(" type: ", gv[1])
    println(" islast: ", Bool(gv[2]))
    println(" length: ", gv[3])
    if gv[1] == 0
        show(unsafe_load(reinterpret(Ptr{StreamInfoBlock},mp + 4*sizeof(Int32))))
    end
    if gv[1] == 4
        show(unsafe_load(reinterpret(Ptr{FLACVorbisComment},mp+4*sizeof(Int32))))
    end
    nothing
end

const mcallback_c = cfunction(mcallback, Void, (Ptr{Void}, Ptr{Int32}, Ptr{Void}))

@doc "error callback"->
function ecallback(d::Ptr{Void}, status::Int32, client::Ptr{Void})
    error("Got error callback with status = $status")
end

const ecallback_c = cfunction(ecallback, Void,
                              (Ptr{Void}, Int32, Ptr{Void}))

@doc "write callback" ->
function wcallback(d::Ptr{Void}, frame::Ptr{Int32},
                   buffer::Ptr{Ptr{Int32}}, client::Ptr{Void})
    fr = pointer_to_array(frame,7)
    println("Frame")
    println(" blocksize: ", fr[1])
    println(" samplerate: ", fr[2])
    println(" channels: ", fr[3])
    println(" channel assignment: ", fr[4])
    println(" bits per sample: ", fr[5])
    println(" number type: ", fr[6])
    println(" frame or sample number: ", fr[7])
    zero(Int32)
end

const wcallback_c = cfunction(wcallback, Int32, 
                              (Ptr{Void}, Ptr{Int32},
                               Ptr{Ptr{Int32}}, Ptr{Void})) 

function flacopen(s::AbstractString)
    dd = ccall((:FLAC__stream_decoder_new,flac),Ptr{Void},())
    ccall((:FLAC__stream_decoder_set_md5_checking,flac),Void,(Ptr{Void},Bool),dd,true)
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,flac),Bool,(Ptr{Void},),dd)
    err = ccall((:FLAC__stream_decoder_init_file,flac),Int32,
                (Ptr{Void}, Ptr{UInt8}, Ptr{Void}, Ptr{Void}, Ptr{Void}),
                dd, s, wcallback_c, mcallback_c, ecallback_c)
    dd
end

setmd5(dd::Ptr{Void}) =
    ccall((:FLAC__stream_decoder_set_md5_checking,flac),Void,(Ptr{Void},Bool),dd,true)

setrespondall(dd::Ptr{Void}) = ccall((:FLAC__stream_decoder_set_metadata_respond_all,flac),Bool,(Ptr{Void},),dd)

process_single(dd::Ptr{Void}) = ccall((:FLAC__stream_decoder_process_single,flac),Bool,(Ptr{Void},),dd)

process_metadata(dd::Ptr{Void}) = ccall((:FLAC__stream_decoder_process_until_end_of_metadata,flac),Bool,(Ptr{Void},),dd)

process_stream(dd::Ptr{Void}) = ccall((:FLAC__stream_decoder_process_until_end_of_stream,flac),Bool,(Ptr{Void},),dd)

type StreamEncoder  # type not immutable so that finalizer can be applied
    v::Ptr{Void}
end

Base.unsafe_convert(::Type{Ptr{Void}},en::StreamEncoder) = en.v

function StreamEncoder()
    en = StreamEncoder(ccall((:FLAC__stream_encoder_new,flac),Ptr{Void},()))
    finalizer(en,x->ccall((:FLAC__stream_encoder_delete,flac),Void,(Ptr{Void},),x.v))
    en
end

for (nm,typ) in (("verify",:Bool),
                 ("compression_level",:Cuint), # a value between 0 (fastest, least compression) to 8 (most compression) - default 5
                 ("channels",:Cuint),          # default 2
                 ("bits_per_sample",:Cuint),   # default 16
                 ("sample_rate",:Cuint),       # default 44100
                 ("total_samples_estimate",:Cuint), # default 0
                 ("blocksize",:Cuint))         # default 0 - encoder estimates
    @eval begin
        function $(symbol(string("set_",nm)))(en::StreamEncoder,val)
            ccall(($(string("FLAC__stream_encoder_set_",nm)),flac),Bool,(Ptr{Void},$typ),en,val)
        end
        function $(symbol(string("get_",nm)))(en::StreamEncoder)
            ccall(($(string("FLAC__stream_encoder_get_",nm)),flac),$typ,(Ptr{Void},),en)
        end
    end
end
get_state(en::StreamEncoder) = ccall((:FLAC__stream_encoder_get_state,flac),Int32,(Ptr{Void},),en)

function init_file(en::StreamEncoder,fnm::ByteString)
    ec = ccall((:FLAC__stream_encoder_init_file,flac),UInt32,
               (Ptr{Void},Ptr{Uint8},Ptr{Void},Ptr{Void}),
               en,fnm,C_NULL,C_NULL)
    ec == 0 || error("Error code $ec from stream_encoder_init_file")
    en
end

function process_interleaved(en::StreamEncoder,buf::Vector{Int32})
    nsamp = div(length(buf),get_channels(en))
    ccall((:FLAC__stream_encoder_process_interleaved,flac),Bool,
          (Ptr{Void},Ptr{Int32},Uint32),en,buf,nsamp) ||
         error("process_interleaved failed: encoder_state is $(get_state(en))")
    nothing
end   

function flacwrite(fnm::AbstractString,hdr::WAVHeader,mm::Vector{Int16})
    en = StreamEncoder()
    set_compression_level(en,8)
    set_total_samples_estimate(en, hdr.dsiz >> 2)
    set_channels(en,hdr.channels)
    set_sample_rate(en,hdr.rate)
    set_bits_per_sample(en,hdr.samplebits)
    get_state(en) == 1 || error("encoder state before init_file is not 1")
    init_file(en,fnm)
    get_state(en) == 0 || error("encoder state after init_file is $(get_state(en))")
    ints_per_block = 2048
    buf = Array(Int32,ints_per_block)
    indsm = 1:ints_per_block
    for blk in 1:div(length(mm),ints_per_block)
        process_interleaved(en,copy!(buf,sub(mm,indsm)))
        indsm += ints_per_block
        rem(blk,1000) == 0 && println(lpad(string(blk),8))
    end
    indsm = (indsm.start):length(mm)
    process_interleaved(en,convert(Vector{Int32},sub(mm,indsm)))
    ccall((:FLAC__stream_encoder_finish,flac),Bool,(Ptr{Void},),en)
    show(en)
end

function Base.show(io::IO,en::StreamEncoder)
    println("FLAC Stream Encoder")
    println(" channels: ", Int(get_channels(en)))
    println(" bits per sample: ", Int(get_bits_per_sample(en)))
    println(" sample rate: ", Int(get_sample_rate(en)))
    println(" blocksize: ", Int(get_blocksize(en)))
    println(" encoder state: ", get_state(en))
    println()
end

function readinf(nm::ByteString)
    res = Dict{ASCIIString,ByteString}()
    if isfile(nm)
        open(nm,"r") do io
            for ln in eachline(io)
                vals = map(strip,split(split(chomp(ln),"#")[1],"="))
                if length(vals) == 2 && length(vals[2]) > 0
                    res[vals[1]] = strip(vals[2],'\'')
                end
            end
        end
    end
    res
end

function process_dir(dnm::ByteString)
    cd(dnm) do
        count = 0
        for nm in readdir()
            bb,ee = splitext(nm)
            if ee == ".wav"
                meta = readinf(string(bb,".inf"))
                println(meta)
                hdr,mm = WAVopen(nm)
                flacwrite(string(bb,".flac"),hdr,mm)
                count += 1
            end
        end
    end
    count
end
