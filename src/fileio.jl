function detectwav(io)
    seekstart(io)
    magic = ascii(read(io, UInt8, 4))
    magic == "RIFF" || return false
    seek(io, 8)
    submagic = ascii(read(io, UInt8, 4))

    submagic == "WAVE"
end
add_format(format"WAV", detectwav, "wav", [:FLAC])
add_format(format"FLAC","fLaC",".flac",[:FLAC])
