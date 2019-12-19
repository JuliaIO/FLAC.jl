"""
    StreamDecoderPtr

A Julia type for a libflac stream decoder object.

This type primarily exists so that a finalizer to delete the decoder can be assigned.
"""
mutable struct StreamDecoderPtr  # type not immutable so that finalizer can be applied
    v::Ptr{Cvoid}
end

function StreamDecoderPtr()
    dec = StreamDecoderPtr(ccall((:FLAC__stream_decoder_new,libflac),Ptr{Cvoid},()))
    finalizer(x->ccall((:FLAC__stream_decoder_delete,libflac),Cvoid,(Ptr{Cvoid},),x.v), dec)
    dec
end

Base.unsafe_convert(::Type{Ptr{Cvoid}}, en::StreamDecoderPtr) = en.v

for (nm,typ) in (("ogg_serial_number", :Clong),
                 ("md5_checking", :Bool),
                 ("metadata_respond", :MetaDataType),
                 ("metadata_ignore", :MetaDataType))
    @eval begin
        function $(Symbol(string("set_", nm)))(dd::StreamDecoderPtr, val)
            ccall(($(string("FLAC__stream_decoder_set_",nm)), libflac), Bool,
                (Ptr{Cvoid}, $typ), dd, val)
        end
    end
end

set_md5_checking(dd::StreamDecoderPtr) = set_md5_checking(dd, true)

"""
    set_metadata_respond_all(dd::StreamDecoderPtr)

Set the stream decoder to respond to all metadata blocks.

Must be called before the decoder is initialized.
"""
set_metadata_respond_all(dd::StreamDecoderPtr) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libflac),Bool,(Ptr{Cvoid},),dd)

"""
    set_metadata_ignore_all(dd::StreamDecoderPtr)

Set the stream decoder to ignore all metadata blocks.

Must be called before the decoder is initialized.
"""
set_metadata_ignore_all(dd::StreamDecoderPtr) =
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libflac),Bool,(Ptr{Cvoid},),dd)

"""
    get_state_string(dd::StreamDecoderPtr)

Returns a character string describing the current state of the decoder
"""
get_state_string(dd::StreamDecoderPtr) =
    unsafe_string(ccall((:FLAC__stream_decoder_get_resolved_state_string,libflac), Ptr{UInt8},
                     (Ptr{Cvoid},), dd))

"""
    get_state(dd:StreamDecoderPtr)

Returns the decoder state as a `StreamDecoderState` enum value.
"""
get_state(dd)

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


for (nm,typ) in (("state",:StreamDecoderState),
                 ("md5_checking",:Bool),
                 ("total_samples",:Int64),
                 ("channels",:Cint),
                 ("channel_assignment",:ChannelAssignment),
                 ("bits_per_sample",Cint),
                 ("sample_rate",Cint),
                 ("blocksize",Cint))
    @eval begin
        function $(Symbol(string("get_",nm)))(dd::StreamDecoderPtr)
            ccall(($(string("FLAC__stream_decoder_get_",nm)),libflac),$typ,(Ptr{Cvoid},),dd)
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

"""
    debug_mcallback(d::Ptr{Cvoid}, mp::Ptr{Cvoid}, client::Ptr{Cvoid})

Debugging metadata callback function.  Prints a brief description of any
`Info`, `Padding`, `VorbisComment`, or `SeekTable` metadata blocks in the
stream.
"""
function debug_mcallback(d::Ptr{Cvoid}, mp::Ptr{Cvoid}, client::Ptr{Cvoid})
    typ = unsafe_load(reinterpret(Ptr{MetaDataType}, mp))
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

"""
    silent_mcallback(d::Ptr{Cvoid}, mp::Ptr{Cvoid}, client::Ptr{Cvoid})

Silent metadata callback function.  Ignores all metadata blocks.
"""
function silent_mcallback(d::Ptr{Cvoid}, mp::Ptr{Cvoid}, client::Ptr{Cvoid})
    nothing
end

"""
    debug_ecallback(d::Ptr{Cvoid}, status::Int32, client::Ptr{Cvoid})

Error callback function.
"""
function debug_ecallback(d::Ptr{Cvoid}, status::Int32, client::Ptr{Cvoid})
    error("Got error callback with status = $status")
end

"""
    debug_wcallback(dd::Ptr{Cvoid}, hdr::Ptr{FrameHeader},
        buffer::Ptr{Ptr{Int32}}, client::Ptr{Cvoid})

Debugging write callback.  Prints information about every frame written.
Very verbose.  Use with caution.
"""
function debug_wcallback(dd::Ptr{Cvoid}, hdr::Ptr{FrameHeader},
             buffer::Ptr{Ptr{Int32}}, client::Ptr{Cvoid})
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

    data = unsafe_wrap(unsafe_load(buffer), fr.blocksize)/(2^(fr.bits_per_sample - 1))
    zero(Int32)
end

"""
    initfile!(dd::StreamDecoderPtr, fnm::String; wcallback=debug_wcallback_c,
        mcallback=debug_mcallback_c, ecallback=debug_ecallback_c, client_data=nothing)

Initialize the `StreamDecoderPtr`, `dd`, to read the FLAC file `fnm`.

This function allows the user to override any of the default callback functions.
"""
function initfile!(dd::StreamDecoderPtr, fnm::String; wcallback=debug_wcallback_c,
                   mcallback=debug_mcallback_c, ecallback=debug_ecallback_c, client_data=nothing)
    status = ccall((:FLAC__stream_decoder_init_file,libflac),DecoderInitStatus,
                   (Ptr{Cvoid}, Ptr{UInt8}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}),
                   dd, fnm, wcallback, mcallback, ecallback, client_data)
    if status != DecoderInitOK
        error("decoder_init_file returned status $status")
    end
    dd
end

function process_single(dd::StreamDecoderPtr)
    disable_sigint() do
        ccall((:FLAC__stream_decoder_process_single,libflac), Bool, (Ptr{Cvoid},), dd)
    end
end
function process_metadata(dd::StreamDecoderPtr)
    disable_sigint() do
        ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libflac), Bool, (Ptr{Cvoid},), dd)
    end
end
function process_stream(dd::StreamDecoderPtr)
    disable_sigint() do
        ccall((:FLAC__stream_decoder_process_until_end_of_stream,libflac), Bool, (Ptr{Cvoid},), dd)
    end
end
function seek_absolute(dd::StreamDecoderPtr, offset::UInt64)
    disable_sigint() do
        ccall((:FLAC__stream_decoder_seek_absolute,libflac), Bool, (Ptr{Cvoid},UInt64), dd, offset)
    end
end
function flush(dd::StreamDecoderPtr)
    disable_sigint() do
        ccall((:FLAC__stream_decoder_flush,libflac), Bool, (Ptr{Cvoid},), dd)
    end
end

function saving_mcallback(d::Ptr{Cvoid}, mp::Ptr{Cvoid}, client::Ptr{Cvoid})
    typ = unsafe_load(reinterpret(Ptr{MetaDataType}, mp))
    if typ == Info
        f = unsafe_pointer_to_objref(client)
        f.metadata = unsafe_load(reinterpret(Ptr{InfoMetaData}, mp))
    end
    return nothing
end

function buffering_wcallback(dd::Ptr{Cvoid}, hdr::Ptr{FrameHeader},
                   buffer::Ptr{Ptr{Int32}}, client::Ptr{Cvoid})
    fr = unsafe_load(hdr)
    f = unsafe_pointer_to_objref(client)

    max_val = Float32(2^(fr.bits_per_sample - 1))
    for chidx = 1:fr.channels
        ch_data = unsafe_load(buffer, chidx)
        f.chunk[1:fr.blocksize, chidx] = unsafe_wrap(Array, ch_data, fr.blocksize)/max_val
    end
    # Set the current blocksize and how much we've consumed from it
    f.chunk_len = fr.blocksize
    f.chunk_consumed = 0
    return zero(Int32)
end

mutable struct FLACDecoder
    # Filename of the file this actually represents
    filename::String

    # Pointer to our decoder object
    dec::StreamDecoderPtr

    # Metadata for this FLAC file
    metadata::InfoMetaData

    # Current chunk of audio data, its length (we allocate maximum framesize,
    # but frames can vary in size) and how much we've consumed from it, so we
    # know where to pick up next when reading in
    chunk::Array{Float32,2}
    chunk_len::UInt
    chunk_consumed::UInt

    function FLACDecoder(path::String)
        dec = StreamDecoderPtr()

        # Create initial, empty FLACDecoder object
        f = new(path, dec, InfoMetaData(), Array{Float32,2}(undef, 0, 0), 0, 0)

        # Open file, process metadata
        initfile!(dec, path, wcallback=buffering_wcallback_c, mcallback=saving_mcallback_c, client_data=pointer_from_objref(f))
        process_metadata(dec)

        # Initialize chunk storage
        f.chunk = Array{Float32,2}(undef, f.metadata.maxblocksize, f.metadata.channels)
        return f
    end
end

"""
    read(f::FLACDecoder, num_samples::Integer)

Read up to the specified number of samples from the given FLACDecoder,
"""
function read(f::FLACDecoder, num_samples::T) where T<:Integer
    # Allocate memory to hold all the read data
    data = Array{Float32,2}(undef, num_samples, f.metadata.channels)
    data_read = 0

    # Save our current position, and read until we hit an error or exceed our
    # num_samples read:
    while data_read < num_samples
        data_needed = num_samples - data_read
        data_avail = f.chunk_len - f.chunk_consumed

        # If we've got data to load in from a previous chunk, then do so
        if data_avail > 0
            # Take only as much as we need, or as much as we can
            amnt = min(data_needed, data_avail) - 1

            # Copy from the chunk into data
            d_start = data_read + 1
            f_start = f.chunk_consumed + 1
            data[d_start:d_start + amnt, :] = f.chunk[f_start:f_start + amnt, :]

            # Increment data_read and chunk_consumed for proper bookkeeping
            data_read += amnt + 1
            f.chunk_consumed += amnt + 1
        else
            # If we have no data ready for us, read it in!
            if !process_single(f.dec)
                # If this fails, quit out with whatever we've managed to get
                return data[1:data_read]
            end
            # Did we not actually get any new data?
            if f.chunk_len - f.chunk_consumed == 0
                return data[1:data_read]
            end
        end
    end

    return data
end

"""
    seek(f::FLACDecoder, offset::Int64)

Perform an absolute seek within the given FLAC stream.  Throws an
`ArgumentError` if the requested seek is impossible.  Will automatically
`flush()` the decoder stream if a seek error is encountered.
"""
function seek(f::FLACDecoder, offset::T) where T<:Integer
    if !seek_absolute(f.dec, UInt64(offset))
        # If we got a seek error, we need to flush the decoder before we
        # can continue decoding, as we've crunked the decoder state. Whoops.
        if get_state(f.dec) == 0x06
            flush(f.dec)
        end
        throw(ArgumentError("Could not seek to offset $offset"))
    end
end

"""
    length(f::FLACDecoder)

Return the total length of the FLAC file in samples
"""
function length(f::FLACDecoder)
    return f.metadata.totalsamples
end

"""
    size(f::FLACDecoder)

Return the size tuple of the FLAC file (length in samples, number of channels)
"""
function size(f::FLACDecoder)
    return (length(f), f.metadata.channels)
end

"""
    load(filename::File{format"FLAC"})

Opens and reads the given filename, returning an array of samples and as well
as the samplerate of the samples stored within the file.  This method is part
of the FileIO integration, do not call directly but instead import the FileIO
bindings and call `load()` with a filename ending in `.flac` to invoke this
method through the FileIO machinery.
"""
function load(file::File{format"FLAC"})
    f = FLACDecoder(file.filename)

    # Return data, fs
    return read(f, length(f)), f.metadata.samplerate
end

# Calculate cfunction versions of all our callbacks once, at runtime, as is necessary with cfunction's
debug_mcallback_c = Ptr{Cvoid}(C_NULL)
silent_mcallback_c = Ptr{Cvoid}(C_NULL)
saving_mcallback_c = Ptr{Cvoid}(C_NULL)
debug_wcallback_c = Ptr{Cvoid}(C_NULL)
buffering_wcallback_c = Ptr{Cvoid}(C_NULL)
debug_ecallback_c = Ptr{Cvoid}(C_NULL)
function init_decoder_cfunctions()
    global debug_mcallback_c     = @cfunction(debug_mcallback, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
    global silent_mcallback_c    = @cfunction(silent_mcallback, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
    global saving_mcallback_c    = @cfunction(saving_mcallback, Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}))
    global debug_wcallback_c     = @cfunction(debug_wcallback, Int32, (Ptr{Cvoid}, Ptr{FrameHeader}, Ptr{Ptr{Int32}}, Ptr{Cvoid}))
    global buffering_wcallback_c = @cfunction(buffering_wcallback, Int32, (Ptr{Cvoid}, Ptr{FrameHeader}, Ptr{Ptr{Int32}}, Ptr{Cvoid}))
    global debug_ecallback_c     = @cfunction(debug_ecallback, Cvoid, (Ptr{Cvoid}, Int32, Ptr{Cvoid}))
end
