immutable WAVHeader
    RIFF::NTuple{4,UInt8}
    fsz1::UInt32
    WAVE::NTuple{4,UInt8}
    fmt::NTuple{4,UInt8}
    hlen::UInt32
    typ::UInt16
    channels::UInt16
    rate::UInt32
    chunk::UInt32
    ttyp::UInt16
    samplebits::UInt16
    data::NTuple{4,UInt8}
    dsiz::UInt32
end

function Base.show(io::IO,hdr::WAVHeader)
    println(io, "WAV file header")
    println(io, " size of header: ", Int(hdr.hlen), " bytes")
    println(io, " type: ", hdr.typ == 1 ? "PCM" : "unknown")
    println(io, " channels: ", Int(hdr.channels))
    println(io, " rate: ", Int(hdr.rate), "Hz.")
    println(io, " track type: ", ["8-bit mono","16-bit mono", "8-bit stereo", "16-bit stereo"][hdr.ttyp])
    println(io, " samplebits: ", Int(hdr.samplebits))
    println(io, " data size: ", Int(hdr.dsiz), " bytes")
end

type InvalidWAVHeader <: Exception
end

function WAVheader(bb::Vector{UInt8})
    length(bb) == 44 || error("WAV header must be 44 bytes")
    h = unsafe_load(convert(Ptr{WAVHeader},pointer(bb)))
    ok = h.RIFF == ('R','I','F','F')
    ok &= h.WAVE == ('W','A','V','E')
    ok &= h.fmt == ('f','m','t',' ')
    ok && h.data == ('d','a','t','a') || throw(InvalidWAVHeader())
    h
end

function WAVopen(fnm::AbstractString)
    ENDIAN_BOM == 0x04030201 || error("Requires a little endian host")
    f = open(fnm,"r")
    h = WAVheader(readbytes(f,44))
    mm = Mmap.mmap(f,Array{Int16,1},(h.dsiz >> 1,))
    close(f)
    h, mm
end
