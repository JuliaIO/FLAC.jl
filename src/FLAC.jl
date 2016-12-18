__precompile__()

module FLAC

using FileIO

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
    init_decoder_cfunctions()
    init_encoder_cfunctions()
end

end # module
