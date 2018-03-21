using BinDeps

@BinDeps.setup

libflac = library_dependency("libflac",aliases=["libFLAC","libFLAC-8"])
libogg = library_dependency("libogg",aliases=["libogg-0"])
libvorbis = library_dependency("libvorbis",aliases=["libvorbis-0"])

provides(AptGet,"libflac-dev",libflac)
provides(AptGet,"libogg-dev",libogg)
provides(AptGet,"libvorbis-dev",libvorbis)

@static if is_apple()
    using Homebrew
    provides( Homebrew.HB, "flac", libflac, os = :Darwin )
    provides( Homebrew.HB, "libogg", libogg, os = :Darwin )
    provides( Homebrew.HB, "libvorbis", libvorbis, os = :Darwin )
end

@static if is_windows()
    using WinRPM
    provides(WinRPM.RPM, "flac", libflac, os = :Windows )
    provides(WinRPM.RPM, "libogg0", libogg, os = :Windows )
    provides(WinRPM.RPM, "libvorbis0", libvorbis, os = :Windows )
end

@BinDeps.install Dict(:libflac => :libflac,:libogg => :libogg)
