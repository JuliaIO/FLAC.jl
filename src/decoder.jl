"""
Flac stream decoder object.  Contains an opaque pointer only.
"""
type StreamDecoderPtr  # type not immutable so that finalizer can be applied
    v::Ptr{Void}
end

Base.unsafe_convert(::Type{Ptr{Void}},en::StreamDecoderPtr) = en.v

function StreamDecoderPtr()
    en = StreamDecoderPtr(ccall((:FLAC__stream_decoder_new,libflac),Ptr{Void},()))
    finalizer(en,x->ccall((:FLAC__stream_decoder_delete,libflac),Void,(Ptr{Void},),x.v))
    en
end

for (nm,typ) in (("ogg_serial_number",:Clong),
                 ("md5_checking",:Bool),
                 ("metadata_respond",:MetadataType),
                 ("metadata_ignore",:MetadataType))
    @eval begin
        function $(symbol(string("set_",nm)))(dd::StreamDecoderPtr,val)
            ccall(($(string("FLAC__stream_decoder_set_",nm)),libflac),Bool,(Ptr{Void},$typ),dd,val)
        end
    end
end

set_md5_checking(dd::StreamDecoderPtr) = set_md5_checking(dd,true)

"""
Set the stream decoder to respond to any metadata block.

Must be called before the decoder is initialized.
"""
set_metadata_respond_all(dd::StreamDecoderPtr) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libflac),Bool,(Ptr{Void},),dd)

"""
Set the stream decoder to skipp all metadata blocks.

Must be called before the decoder is initialized.
"""
set_metadata_ignore_all(dd::StreamDecoderPtr) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libflac),Bool,(Ptr{Void},),dd)

"""
Returns a character string describing the current state of the decoder
"""
get_state_string(dd::StreamDecoderPtr) =
    bytestring(ccall((:FLAC__stream_decoder_get_resolved_state_string,libflac),Ptr{UInt8},
                     (Ptr{Void},),dd))

@enum(StreamDecoderState,
      DecoderMetaDataSearch,
      DecoderMetaDataRead,
      DecoderFrameSyncSearch,
      DecoderFrameRead,
      DecoderEndOfStream,
      DecoderOggError,
      DecoderSeekError,
      DecoderAborted,
      DecoderMemoryAllocationError,
      DecoderUninitialized)

for (nm,typ) in (("state",:DecoderState),
                 ("md5_checking",:Bool),
                 ("total_samples",:Int64),
                 ("channels",:Cint),
                 ("channel_assignment",:ChannelAssignment),
                 ("bits_per_sample",Cint),
                 ("sample_rate",Cint),
                 ("blocksize",Cint))
    @eval begin
        function $(symbol(string("get_",nm)))(dd::StreamDecoderPtr)
            ccall(($(string("FLAC__stream_decoder_get_",nm)),libflac),$typ,(Ptr{Void},),dd)
        end
    end
end

@enum(DecoderInitStatus,
      DecoderInitOK,
      DecoderInitUnsupportedContainer,
      DecoderInitInvalidCallbacks,
      DecoderInitMemoryAllocationError2,
      DecoderInitErrorOpeningFile,
      DecoderInitAlreadyInitialized)

"standard metadata callback function" 
function mcallback(d::Ptr{Void}, mp::Ptr{Void}, client::Ptr{Void})
    typ = pointer_to_array(reinterpret(Ptr{MetadataType},mp),1)[1]
    println("Metadata callback on typ = ", typ)
    if typ == InfoType
        show(StreamInfoMetaData(mp))
    elseif typ == PaddingType
        show(StreamPaddingMetaData(mp))
    elseif typ == VorbisCommentType
        show(StreamVorbisCommentMetaData(mp))
    elseif typ == SeektableType
        show(StreamSeekTableMetaData(mp))
    end
    nothing
end

const mcallback_c = cfunction(mcallback, Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}))

"error callback"
function ecallback(d::Ptr{Void}, status::Int32, client::Ptr{Void})
    error("Got error callback with status = $status")
end

const ecallback_c = cfunction(ecallback, Void,
                              (Ptr{Void}, Int32, Ptr{Void}))

"write callback"
function wcallback(dd::Ptr{Void}, hdr::Ptr{FrameHeader},
                   buffer::Ptr{Ptr{Int32}}, client::Ptr{Void})
    fr = unsafe_load(hdr)
    println("Frame")
    println(" blocksize: ", fr.blocksize)
    println(" samplerate: ", fr.sample_rate)
    println(" channels: ", fr.channels)
    println(" channel assignment: ", fr.channel_assignment)
    println(" bits per sample: ", fr.bits_per_sample)
    println(" number type: ", fr.typ)
    println(" frame or sample number: ", fr.num)
    println(" crc: ", fr.crc)
    zero(Int32)
end

const wcallback_c = cfunction(wcallback, Int32, 
                              (Ptr{Void}, Ptr{FrameHeader},
                               Ptr{Ptr{Int32}}, Ptr{Void})) 

function initfile!(dd::StreamDecoderPtr,fnm::ByteString)
    status = ccall((:FLAC__stream_decoder_init_file,libflac),DecoderInitStatus,
                   (Ptr{Void}, Ptr{UInt8}, Ptr{Void}, Ptr{Void}, Ptr{Void}),
                   dd, fnm, wcallback_c, mcallback_c, ecallback_c)
    if status != DecoderOK
        error("decoder_init_file returned status $status")
    end
    dd
end

process_single(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_single,libflac),Bool,(Ptr{Void},),dd)

process_metadata(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libflac),Bool,(Ptr{Void},),dd)

process_stream(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_until_end_of_stream,libflac),Bool,(Ptr{Void},),dd)
