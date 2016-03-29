__precompile__()

module FLAC

using FileIO

import FileIO: load, save

export
       StreamMetaData,
       InfoMetaData,
       VorbisCommentMetaData,
       PaddingMetaData,
       ApplicationMetaData,
       SeekTableMetaData,
       CueSheetMetaData,

       StreamDecoder,
       StreamEncoder,
       initfile!,
       load,
       query,
       save

const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depfile)
    include(depfile)
else
    error("FLAC not properly installed. Please run Pkg.build(\"FLAC\")")
end

include("WAV.jl")
include("metadata.jl")
include("format.jl")
include("decoder.jl")
include("encoder.jl")
include("fileio.jl")

end # module
