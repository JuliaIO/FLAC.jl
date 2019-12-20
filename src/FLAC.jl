__precompile__()

module FLAC

using FileIO
using FLAC_jll

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

include("metadata.jl")
include("format.jl")
include("decoder.jl")
include("encoder.jl")

function __init__()
    init_decoder_cfunctions()
    init_encoder_cfunctions()
end

end # module
