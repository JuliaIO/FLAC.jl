using FLAC
using WAV
using Base.Test

testdir = dirname(@__FILE__)

# Start by loading our ground truth data from the .wav
# This data generated as sin(linspace(0,4410*2*pi,44100)[1:441])
check_data, check_fs = wavread(joinpath(testdir, "4410hz.wav"))

# Load flac'ed version of 4410hz.wav (generated with `ffmpeg -i 4410hz.wav -acodec flac 4410hz.flac`)
data, fs = load(joinpath(testdir, "4410hz.flac"))
@test fs == check_fs
@test size(data) == (441,1)
@test maximum(abs(check_data - data)) < 1e-6


# Test against 16-bit FLAC file (generated with `ffmpeg -i 4410hz.wav -acodec flac -sample_fmt s16 4410hz_s16.flac`)
s16_data, s16_fs = load(joinpath(testdir, "4410hz_s16.flac"))
@test s16_fs == check_fs
@test size(s16_data) == (441,1)
@test maximum(abs(check_data - s16_data)) < 1e-4   # reduced precision due to s16 format


# Test multichannel FLAC file (left and right channels opposing polarity versions of 4410hz signal)
stereo_data = load(joinpath(testdir, "stereo.flac"))[1]
stereo_check_data = wavread(joinpath(testdir, "stereo.wav"))[1]
@test size(stereo_data) == size(stereo_check_data)
@test maximum(abs(stereo_data - stereo_check_data)) < 1e-6
