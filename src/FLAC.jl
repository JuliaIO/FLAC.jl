__precompile__()

module FLAC

using FileIO

# This `OggWrapper` is literally only just so that `libogg` is loaded into the
# Julia namespace, which is necessary for `libFLAC` to load properly.
# It looks like the original issue https://github.com/JuliaPackaging/BinaryBuilder.jl/issues/194
# has been solved, so we just need to make another BinaryBuilder release of libFLAC
# and then this can be deleted.
module OggWrapper
    import Ogg
    const depfile = joinpath(dirname(pathof(Ogg)), "..", "deps", "deps.jl")
    if isfile(depfile)
        include(depfile)
    else
        error("Ogg not properly installed. Please run Pkg.build(\"Ogg\")")
    end
end

export StreamMetaData,
       InfoMetaData,
       VorbisCommentMetaData,
       PaddingMetaData,
       ApplicationMetaData,
       SeekTableMetaData,
       CueSheetMetaData,
       StreamDecoderPtr,
       StreamEncoderPtr,
       initfile!,
       FLACDecoder,
       seek,
       read,
       size,
       length

import Base: read, seek, size, length

const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depfile)
    include(depfile)
else
    error("FLAC not properly installed. Please run Pkg.build(\"FLAC\")")
end

include("metadata.jl")
include("format.jl")
include("decoder.jl")
include("encoder.jl")

function __init__()
    OggWrapper.check_deps()
    init_decoder_cfunctions()
    init_encoder_cfunctions()
end

end # module
