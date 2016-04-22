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
Set the stream decoder to respond to all metadata blocks.

Must be called before the decoder is initialized.
"""
set_metadata_respond_all(dd::StreamDecoderPtr) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libflac),Bool,(Ptr{Void},),dd)

"""
Set the stream decoder to ignore all metadata blocks.

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

"debugging metadata callback function"
function debug_mcallback(d::Ptr{Void}, mp::Ptr{Void}, client::Ptr{Void})
    typ = unsafe_load(reinterpret(Ptr{MetaDataType},mp))
    println("Metadata callback on typ = ", typ)
    if typ == Info
        show(unsafe_load(reinterpret(Ptr{InfoMetaData}, mp)))
    elseif typ == Padding
        show(unsafe_load(reinterpret(Ptr{PaddingMetaData}, mp)))
    elseif typ == VorbisComment
        show(unsafe_load(reinterpret(Ptr{VorbisComment}, mp)))
    elseif typ == SeekTable
        show(unsafe_load(reinterpret(Ptr{SeekTable}, mp)))
    end
    nothing
end
"silent metadata callback function"
function silent_mcallback(d::Ptr{Void}, mp::Ptr{Void}, client::Ptr{Void})
    nothing
end


"error callback"
function debug_ecallback(d::Ptr{Void}, status::Int32, client::Ptr{Void})
    error("Got error callback with status = $status")
end

"debugging write callback"
function debug_wcallback(dd::Ptr{Void}, hdr::Ptr{FrameHeader},
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

    data = pointer_to_array(unsafe_load(buffer), fr.blocksize)/(2^(fr.bits_per_sample - 1))
    zero(Int32)
end


function initfile!(dd::StreamDecoderPtr, fnm::ByteString; wcallback=debug_wcallback_c,
                   mcallback=debug_mcallback_c, ecallback=debug_ecallback_c, client_data=nothing)
    status = ccall((:FLAC__stream_decoder_init_file,libflac),DecoderInitStatus,
                   (Ptr{Void}, Ptr{UInt8}, Ptr{Void}, Ptr{Void}, Ptr{Void}, Ptr{Void}),
                   dd, fnm, wcallback, mcallback, ecallback, client_data)
    if status != DecoderInitOK
        error("decoder_init_file returned status $status")
    end
    dd
end

process_single(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_single,libflac),Bool,(Ptr{Void},),dd)

process_metadata(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libflac),Bool,(Ptr{Void},),dd)

process_stream(dd::StreamDecoderPtr) = ccall((:FLAC__stream_decoder_process_until_end_of_stream,libflac),Bool,(Ptr{Void},),dd)

function saving_mcallback(d::Ptr{Void}, mp::Ptr{Void}, client::Ptr{Void})
    typ = unsafe_load(reinterpret(Ptr{MetaDataType},mp))
    if typ == Info
        client_data = unsafe_pointer_to_objref(client)
        client_data["metadata"] = InfoMetaData(unsafe_load(reinterpret(Ptr{InfoMetaData}, mp)))
    end
    nothing
end

function buffering_wcallback(dd::Ptr{Void}, hdr::Ptr{FrameHeader},
                   buffer::Ptr{Ptr{Int32}}, client::Ptr{Void})
    fr = unsafe_load(hdr)
    client_data = unsafe_pointer_to_objref(client)

    max_val = Float32(2^(fr.bits_per_sample - 1))
    for chidx = 1:fr.channels
        start_idx = client_data["channel_idxs"][chidx]
        client_data["channels"][start_idx:start_idx + fr.blocksize - 1,chidx] = pointer_to_array(unsafe_load(buffer,chidx), fr.blocksize)/max_val
        client_data["channel_idxs"][chidx] += fr.blocksize
    end
    zero(Int32)
end


function load(f::File{format"FLAC"})
    decoder = StreamDecoderPtr()

    client_data = Dict()
    initfile!(decoder, f.filename, wcallback=buffering_wcallback_c, mcallback=saving_mcallback_c, client_data=pointer_from_objref(client_data))

    # Peek at just the metadata
    process_metadata(decoder)

    # Create a list of Arrays to hold our sampledata for each channel assigned to us
    client_data["channels"] = Array{Float32,2}(client_data["metadata"].totalsamples, client_data["metadata"].channels)
    client_data["channel_idxs"] = ones(UInt64, client_data["metadata"].channels)

    # Process the rest of the stream
    process_stream(decoder)

    # Return data, fs
    return client_data["channels"], client_data["metadata"].samplerate
end

# Calculate cfunction versions of all our callbacks once, at runtime, as is necessary with cfunction's
debug_mcallback_c = Ptr{Void}(C_NULL)
silent_mcallback_c = Ptr{Void}(C_NULL)
saving_mcallback_c = Ptr{Void}(C_NULL)
debug_wcallback_c = Ptr{Void}(C_NULL)
buffering_wcallback_c = Ptr{Void}(C_NULL)
debug_ecallback_c = Ptr{Void}(C_NULL)
function init_decoder_cfunctions()
    global debug_mcallback_c     = cfunction(debug_mcallback, Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}))
    global silent_mcallback_c    = cfunction(silent_mcallback, Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}))
    global saving_mcallback_c    = cfunction(saving_mcallback, Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}))
    global debug_wcallback_c     = cfunction(debug_wcallback, Int32, (Ptr{Void}, Ptr{FrameHeader}, Ptr{Ptr{Int32}}, Ptr{Void}))
    global buffering_wcallback_c = cfunction(buffering_wcallback, Int32, (Ptr{Void}, Ptr{FrameHeader}, Ptr{Ptr{Int32}}, Ptr{Void}))
    global debug_ecallback_c     = cfunction(debug_ecallback, Void, (Ptr{Void}, Int32, Ptr{Void}))
end
