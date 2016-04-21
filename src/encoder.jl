"""
Flac stream encoder object.

All it contains is an opaque pointer.
The zero-argument constructor creates a new stream decoder and wraps the pointer.

The type is not an immutable because it uses a finalizer.
"""
type StreamEncoderPtr  # type not immutable so that finalizer can be applied
    v::Ptr{Void}
end

"""
Allows for passing the instance of the type in a `ccall`.
"""
Base.unsafe_convert(::Type{Ptr{Void}},en::StreamEncoderPtr) = en.v

function StreamEncoderPtr()
    en = StreamEncoderPtr(ccall((:FLAC__stream_encoder_new,libflac),Ptr{Void},()))
    finalizer(en,x->ccall((:FLAC__stream_encoder_delete,libflac),Void,(Ptr{Void},),x.v))
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
        function $(symbol(string("set_",nm)))(en::StreamEncoderPtr,val)
            ccall(($(string("FLAC__stream_encoder_set_",nm)),libflac),Bool,(Ptr{Void},$typ),en,val)
        end
        function $(symbol(string("get_",nm)))(en::StreamEncoderPtr)
            ccall(($(string("FLAC__stream_encoder_get_",nm)),libflac),$typ,(Ptr{Void},),en)
        end
    end
end

function set_metadata(en::StreamEncoderPtr,mdpv::Vector{Ptr{StreamMetaData}})
    ccall((:FLAC__stream_encoder_set_metadata,libflac),Cint,
          (Ptr{Void},Ptr{Ptr{StreamMetaData}},Cuint),en,mdpv,length(mpdv)) ||
        error("Call to stream_encoder_set_metadata failed")
    en
end

@enum(StreamEncoderState,
      EncoderOK,
      EncoderUninitialized,
      EncoderOggError,
      EncoderVerifyDecoderError,
      EncoderVerifyMismatchInAudioData,
      EncoderClientError,
      EncoderIOError,
      EncoderFramingError,
      EncoderMemoryAllocationError)

get_state(en::StreamEncoderPtr) =
    ccall((:FLAC__stream_encoder_get_state,libflac),StreamEncoderState,(Ptr{Void},),en)

@enum(StreamEncoderInitStatus,
      EncoderInitOK,
      EncoderInitEncoderError,
      EncoderInitInvalidCallbacks,
      EncoderInitInvalidNumberOfChannels,
      EncoderInitInvalidSampleRate,
      EncoderInitInvalidBlockSize,
      EncoderInitInvalidMaxLPCSize,
      EncoderInitInvalidQLPCoeffPrec,
      EncoderInitBlockSizeTooSmallForLPCOrder,
      EncoderInitNotStreamable,
      EncoderInitInvalidMetadata,
      EncoderInitAlreadyInitialized)

@enum(StreamEncoderReadStatus,
      ReadStatusContinue,
      ReadStatusEndOfStream,
      ReadStatusAbort,
      ReadStatusUnsupported)

@enum(StreamEncoderWriteStatus,
      WriteStatusOK,
      WriteStatusFatalError)

@enum(StreamEncoderSeekStatus,
      SeekStatusOK,
      SeekStatusError,
      SeekStatusUnsupported)

@enum(StreamEncoderTellStatus,
      TellStatusOK,
      TellStatusError,
      TellStatusUnsupported)

finish(en::StreamEncoderPtr) = ccall((:FLAC__stream_encoder_finish,libflac),Int32,(Ptr{Void},),en)

"standard progress callback function"
function pcallback(en::Ptr{Void},bytesw::Int64,samplesw::Int64,
                   framesw::Cint,totalframesest::Cint,client::Ptr{Void})
    nothing
end

const pcallback_c = cfunction(pcallback, Void, (Ptr{Void},Int64,Int64,Cint,Cint,Ptr{Void}))

"""
### init_file

Initialize the `StreamEncoder` object `en` to write the file `fnm`.

Note that setting stream characteristics (`channels`, `bits_per_sample`, etc.)
must be done **before** initializing the encoder.
"""
function init_file(en::StreamEncoderPtr,fnm::ByteString)
    ec = ccall((:FLAC__stream_encoder_init_file,libflac),StreamEncoderInitStatus,
               (Ptr{Void},Ptr{UInt8},Ptr{Void},Ptr{Void}),
               en,fnm,pcallback_c,C_NULL)
    ec == EncoderInitOK || error("Error code $ec from stream_encoder_init_file")
    en
end

function process_interleaved(en::StreamEncoderPtr,buf::Vector{Int32})
    nsamp = div(length(buf),get_channels(en))
    ccall((:FLAC__stream_encoder_process_interleaved,libflac),Bool,
          (Ptr{Void},Ptr{Int32},UInt32),en,buf,nsamp) ||
         error("process_interleaved failed: encoder_state is $(get_state(en))")
    nothing
end

function Base.show(io::IO,en::StreamEncoderPtr)
    println("FLAC Stream Encoder")
    println(" channels: ", Int(get_channels(en)))
    println(" bits per sample: ", Int(get_bits_per_sample(en)))
    println(" sample rate: ", Int(get_sample_rate(en)))
    println(" blocksize: ", Int(get_blocksize(en)))
    println(" encoder state: ", get_state(en))
    println()
end

function flacwrite(fnm::AbstractString,num_channels::Cuint,samplerate::Cuint,bits_per_sample::Cuint,mm::Vector{Int16},mdpv::Vector=[])
    en = StreamEncoderPtr()
    set_compression_level(en,8)
    set_total_samples_estimate(en, hdr.dsiz >> 2)
    set_channels(en,num_channels)
    set_sample_rate(en,samplerate)
    set_bits_per_sample(en,bits_per_sample)
    if isa(mdpv,Vector{Ptr{StreamMetaData}})
        ccall((:FLAC__stream_encoder_set_metadata,libflac),Bool,
              (Ptr{Void},Ptr{Ptr{StreamMetaData}},Cuint),
              en,mdpv,length(mdpv)) || error("call to stream_encoder_set_metadata failed")
    end
    get_state(en) == EncoderUninitialized || error("encoder state before init_file is incorrect")
    init_file(en,fnm)
    get_state(en) == EncoderOK || error("encoder state after init_file is $(get_state(en))")
    ints_per_block = 2048
    buf = Array(Int32,ints_per_block)
    indsm = 1:ints_per_block
    for blk in 1:div(length(mm),ints_per_block)
        process_interleaved(en,copy!(buf,sub(mm,indsm)))
        indsm += ints_per_block
    end
    indsm = (indsm.start):length(mm)
    process_interleaved(en,convert(Vector{Int32},sub(mm,indsm)))
    ccall((:FLAC__stream_encoder_finish,libflac),Bool,(Ptr{Void},),en)
end
