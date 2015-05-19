module FLAC

export
       StreamInfoMetaData,
       StreamVorbisCommentMetaData,
       StreamPaddingMetaData,
       StreamApplicationMetaData,
       StreamSeekTableMetaData,
       StreamCueSheetMetaData,

       StreamDecoder,
       StreamEncoder,
       initfile,
       flacwrite

const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depfile)
    include(depfile)
else
    error("FLAC not properly installed. Please run Pkg.build(\"FLAC\")")
end

include("metadata.jl")
include("decoder.jl")

end # module
