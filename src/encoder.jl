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


function Base.show(io::IO,en::StreamEncoder)
    println("FLAC Stream Encoder")
    println(" channels: ", Int(get_channels(en)))
    println(" bits per sample: ", Int(get_bits_per_sample(en)))
    println(" sample rate: ", Int(get_sample_rate(en)))
    println(" blocksize: ", Int(get_blocksize(en)))
    println(" encoder state: ", get_state(en))
    println()
end

function flacwrite(fnm::AbstractString,mm::Vector{Int16},hdr::Dict=Dict{ASCIIString,Any}())
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
