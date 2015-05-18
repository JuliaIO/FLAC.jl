using BinDeps
using Compat

@BinDeps.setup

flac = library_dependency("libflac",aliases=["libFLAC"])

provides(AptGet,"libflac-dev",flac)

@BinDeps.install Dict(:libflac => :flac)
