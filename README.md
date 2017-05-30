# FLAC.jl

Julia bindings for libFLAC

[![Travis Build Status](https://travis-ci.org/dmbates/FLAC.jl.svg?branch=master)](https://travis-ci.org/dmbates/FLAC.jl)  [![Appveyor Build Status](https://ci.appveyor.com/api/projects/status/32r7s2skrgm9ubva?svg=true)](https://ci.appveyor.com/project/dmbates/flac-jl)

## Usage
Integration through [FileIO](https://github.com/JuliaIO/FileIO.jl) makes loading and saving easy:

```julia
data, fs = load("input.flac")
data = data * 2
save("output.flac", data, fs)
```

`save()` can also take extra keyword parameters such as `bits_per_sample` and `compression_level` if such parameters are important.  More advanced usage is possible through the use of the `FLACDecoder` API, which allows for, among other things, seeking within `.flac` streams and decoding segments of streams.
