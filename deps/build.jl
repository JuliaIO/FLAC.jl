using BinDeps
using Compat

@BinDeps.setup

libflac = library_dependency("libflac",aliases=["libFLAC"])
libogg = library_dependency("libogg")
libvorbis = library_dependency("libvorbis")

provides(AptGet,"libflac-dev",libflac)
provides(AptGet,"libogg-dev",libogg)
provides(AptGet,"libvorbis-dev",libvorbis)

@osx_only begin
    if Pkg.installed("Homebrew") === nothing
        error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")  end
    using Homebrew
    provides( Homebrew.HB, "flac", libflac, os = :Darwin )
    provides( Homebrew.HB, "libogg", libogg, os = :Darwin )
    provides( Homebrew.HB, "libvorbis", libvorbis, os = :Darwin )
end

@BinDeps.install Dict(:libflac => :libflac,:libogg => :libogg)
