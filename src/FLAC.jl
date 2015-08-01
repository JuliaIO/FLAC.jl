module FLAC

export
       InfoMetaData,
       VorbisCommentMetaData,
       PaddingMetaData,
       ApplicationMetaData,
       SeekTableMetaData,
       CueSheetMetaData,

       StreamDecoder,
       StreamEncoder,
       initfile!

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


end # module
