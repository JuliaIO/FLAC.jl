@doc """
Flac stream decoder object.  Contains an opaque pointer only.
"""->
type StreamDecoder  # type not immutable so that finalizer can be applied
    v::Ptr{Void}
end

Base.unsafe_convert(::Type{Ptr{Void}},en::StreamDecoder) = en.v

function StreamDecoder()
    en = StreamDecoder(ccall((:FLAC__stream_decoder_new,flac),Ptr{Void},()))
    finalizer(en,x->ccall((:FLAC__stream_decoder_delete,flac),Void,(Ptr{Void},),x.v))
    en
end

for (nm,typ) in (("ogg_serial_number",:Clong),
                 ("md5_checking",:Bool),
                 ("metadata_respond",:MetadataType),
                 ("metadata_ignore",:MetadataType))
    @eval begin
        function $(symbol(string("set_",nm)))(dd::StreamDecoder,val)
            ccall(($(string("FLAC__stream_decoder_set_",nm)),flac),Bool,(Ptr{Void},$typ),dd,val)
        end
    end
end

set_md5_checking(dd::StreamDecoder) = set_md5_checking(dd,true)

set_metadata_respond_all(dd::StreamDecoder) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,flac),Bool,(Ptr{Void},),dd)

set_metadata_ignore_all(dd::StreamDecoder) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,flac),Bool,(Ptr{Void},),dd)

get_state_string(dd::StreamDecoder) =
    bytestring(ccall((:FLAC__stream_decoder_get_resolved_state_string,flac),Ptr{UInt8},
                     (Ptr{Void},),dd))

@enum DecoderState MetaDataSearch=0 MetaDataRead=1 FrameSyncSearch=2 FrameRead=3 EndOfStream=4 OggError=5 SeekError=6 Aborted=7 MemoryAllocationError1=8 Uninitialized=9

@enum ChannelAssignment Independent=0 LeftSide=1 RightSide=2 MidSide=3

for (nm,typ) in (("state",:DecoderState),
                 ("md5_checking",:Bool),
                 ("total_samples",:Int64),
                 ("channels",:Cint),
                 ("channel_assignment",:ChannelAssignment),
                 ("bits_per_sample",Cint),
                 ("sample_rate",Cint),
                 ("blocksize",Cint))
    @eval begin
        function $(symbol(string("get_",nm)))(dd::StreamDecoder)
            ccall(($(string("FLAC__stream_decoder_get_",nm)),flac),$typ,(Ptr{Void},),dd)
        end
    end
end

@enum DecoderInitStatus DecoderOK=0 UnsupportedContainer=1 InvalidCallbacks=2 MemoryAllocationError2=3 ErrorOpeningFile=4 AlreadyInitialized=5

@doc "standard metadata callback function" ->
function mcallback(d::Ptr{Void}, mp::Ptr{Void}, client::Ptr{Void})
    typ = pointer_to_array(reinterpret(Ptr{MetadataType},mp),1)[1]
    println("Metadata callback on typ = ", typ)
    if typ == InfoType
        show(StreamInfoMetaData(mp))
    elseif typ == PaddingType
        show(StreamPaddingMetaData(mp))
    elseif typ == VorbisCommentType
        show(StreamVorbisCommentMetaData(mp))
    end
    nothing
end

const mcallback_c = cfunction(mcallback, Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}))

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

function initfile(dd::StreamDecoder,fnm::ByteString)
    status = ccall((:FLAC__stream_decoder_init_file,flac),DecoderInitStatus,
                   (Ptr{Void}, Ptr{UInt8}, Ptr{Void}, Ptr{Void}, Ptr{Void}),
                   dd, fnm, wcallback_c, mcallback_c, ecallback_c)
    if status != DecoderOK
        error("decoder_init_file returned status $status")
    end
    dd
end

process_single(dd::StreamDecoder) = ccall((:FLAC__stream_decoder_process_single,flac),Bool,(Ptr{Void},),dd)

process_metadata(dd::StreamDecoder) = ccall((:FLAC__stream_decoder_process_until_end_of_metadata,flac),Bool,(Ptr{Void},),dd)

process_stream(dd::StreamDecoder) = ccall((:FLAC__stream_decoder_process_until_end_of_stream,flac),Bool,(Ptr{Void},),dd)
