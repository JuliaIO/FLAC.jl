using BinDeps
using Compat

@BinDeps.setup

libflac = library_dependency("libflac",aliases=["libFLAC"])
libogg = library_dependency("libogg")
libvorbis = library_dependency("libvorbis")

provides(AptGet,"libflac-dev",libflac)
provides(AptGet,"libogg-dev",libogg)
provides(AptGet,"libvorbis-dev",libvorbis)

@BinDeps.install Dict(:libflac => :libflac,:libogg => :libogg)
