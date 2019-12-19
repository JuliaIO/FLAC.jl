using FileIO
using WAV
using Test
using FLAC
import Base.GC: gc


@testset "FLAC" begin
    testdir = dirname(@__FILE__)

    # Start by loading our ground truth data from the .wav
    # This data generated as sin(linspace(0,4410*2*pi,44100)[1:441])
    check_data, check_fs = wavread(joinpath(testdir, "4410hz.wav"))

    # Load flac'ed version of 4410hz.wav (generated with `ffmpeg -i 4410hz.wav -acodec flac 4410hz.flac`)
    data, fs = load(joinpath(testdir, "4410hz.flac"))
    @test fs == check_fs
    @test size(data) == size(check_data)
    @test maximum(abs.(check_data - data)) < 1e-6


    # Test against 16-bit FLAC file (generated with `ffmpeg -i 4410hz.wav -acodec flac -sample_fmt s16 4410hz_s16.flac`)
    s16_data, s16_fs = load(joinpath(testdir, "4410hz_s16.flac"))
    @test s16_fs == check_fs
    @test size(s16_data) == size(check_data)
    @test maximum(abs.(check_data - s16_data)) < 1e-4   # reduced precision due to s16 format


    # Test multichannel FLAC file (left and right channels opposing polarity versions of 4410hz signal)
    stereo_data = load(joinpath(testdir, "stereo.flac"))[1]
    stereo_check_data = wavread(joinpath(testdir, "stereo.wav"))[1]
    @test size(stereo_data) == size(stereo_check_data)
    @test maximum(abs.(stereo_data - stereo_check_data)) < 1e-6

    # Test FLACDecoder works with chunked reads
    f = FLACDecoder(joinpath(testdir, "4410hz.flac"))
    chunked = Array{Float32,2}(undef, size(f)...)
    chunked[1:100, :] = read(f, 100)
    chunked[101:end, :] = read(f, length(f) - 100)
    @test f.metadata.samplerate == check_fs
    @test size(f) == size(check_data)
    @test maximum(abs.(check_data - chunked)) < 1e-6

    # Test FLACDecoder seek'ing works
    f = FLACDecoder(joinpath(testdir, "4410hz.flac"))
    seek(f, 100)
    @test maximum(abs.(read(f, 100) - check_data[101:200])) < 1e-6
    @test maximum(abs.(read(f, 100) - check_data[201:300])) < 1e-6
    seek(f, 0)
    @test maximum(abs.(read(f, length(f)) - check_data)) < 1e-6

    # Test that we automatically recover from a seek error properly
    @test_throws ArgumentError seek(f, length(f) + 1000)
    seek(f, 0)
    @test maximum(abs.(read(f, length(f)) - check_data)) < 1e-6


    # Now that we have confidence our decoder works, let's roundtrip a signal multiple times
    function roundtrip(signal, samplerate; params...)
        path = joinpath(testdir,"roundtrip.flac")
        if isfile(path)
            gc()
            rm(path)
        end
        save(path, signal, samplerate; params...)
        recon_signal, recon_fs = load(path)

        # Squeeze the signals to avoid Julia 0.5/0.6 differences
        if ndims(recon_signal) > 1 
            recon_signal = vec(recon_signal)
        end
        if ndims(signal) > 1
            signal = vec(signal)
        end

        @test recon_fs == samplerate
        @test size(recon_signal) == size(signal)
        @test maximum(abs.(recon_signal - signal)) < 1e-4
        gc()
        rm(path)
    end

    test_signal = sin.(range(0,stop=4410*2*pi,length=44100)[1:44100])''*.999
    roundtrip(test_signal, 44100)
    roundtrip(test_signal, 44100, bits_per_sample=16)
    roundtrip(test_signal, 48000, compression_level=8)
end
