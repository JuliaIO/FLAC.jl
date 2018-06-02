# Automatically generated using Clang.jl wrap_c, version 0.0.0
#
# Note: This file is for reference only.  The relevant parts are
# translated to more idiomatic Julia in format.jl

const FLAC__MAX_METADATA_TYPE_CODE = 126
const FLAC__MIN_BLOCK_SIZE = 16
const FLAC__MAX_BLOCK_SIZE = 65535
const FLAC__SUBSET_MAX_BLOCK_SIZE_48000HZ = 4608
const FLAC__MAX_CHANNELS = 8
const FLAC__MIN_BITS_PER_SAMPLE = 4
const FLAC__MAX_BITS_PER_SAMPLE = 32
const FLAC__REFERENCE_CODEC_MAX_BITS_PER_SAMPLE = 24
const FLAC__MAX_SAMPLE_RATE = 655350
const FLAC__MAX_LPC_ORDER = 32
const FLAC__SUBSET_MAX_LPC_ORDER_48000HZ = 12
const FLAC__MIN_QLP_COEFF_PRECISION = 5
const FLAC__MAX_QLP_COEFF_PRECISION = 15
const FLAC__MAX_FIXED_ORDER = 4
const FLAC__MAX_RICE_PARTITION_ORDER = 15
const FLAC__SUBSET_MAX_RICE_PARTITION_ORDER = 8
const FLAC__STREAM_SYNC_LENGTH = 4
const FLAC__STREAM_METADATA_STREAMINFO_LENGTH = 34
const FLAC__STREAM_METADATA_SEEKPOINT_LENGTH = 18
const FLAC__STREAM_METADATA_HEADER_LENGTH = 4

# begin enum ANONYMOUS_1
const ANONYMOUS_1 = UInt32
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE = (UInt32)(0)
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE2 = (UInt32)(1)
# end enum ANONYMOUS_1

# begin enum FLAC__EntropyCodingMethodType
const FLAC__EntropyCodingMethodType = UInt32
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE = (UInt32)(0)
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE2 = (UInt32)(1)
# end enum FLAC__EntropyCodingMethodType

mutable struct FLAC__EntropyCodingMethod_PartitionedRiceContents
    parameters::Ptr{UInt32}
    raw_bits::Ptr{UInt32}
    capacity_by_order::UInt32
end

mutable struct FLAC__EntropyCodingMethod_PartitionedRice
    order::UInt32
    contents::Ptr{FLAC__EntropyCodingMethod_PartitionedRiceContents}
end

mutable struct FLAC__EntropyCodingMethod
    _type::FLAC__EntropyCodingMethodType
    data::Void
end

# begin enum ANONYMOUS_2
const ANONYMOUS_2 = UInt32
const FLAC__SUBFRAME_TYPE_CONSTANT = (UInt32)(0)
const FLAC__SUBFRAME_TYPE_VERBATIM = (UInt32)(1)
const FLAC__SUBFRAME_TYPE_FIXED = (UInt32)(2)
const FLAC__SUBFRAME_TYPE_LPC = (UInt32)(3)
# end enum ANONYMOUS_2

# begin enum FLAC__SubframeType
const FLAC__SubframeType = UInt32
const FLAC__SUBFRAME_TYPE_CONSTANT = (UInt32)(0)
const FLAC__SUBFRAME_TYPE_VERBATIM = (UInt32)(1)
const FLAC__SUBFRAME_TYPE_FIXED = (UInt32)(2)
const FLAC__SUBFRAME_TYPE_LPC = (UInt32)(3)
# end enum FLAC__SubframeType

const FLAC__bool = Bool
const FLAC__byte = UInt8
const FLAC__int32 = Int32
const FLAC__UInt8 = UInt8
const FLAC__UInt16 = UInt16
const FLAC__UInt32 = UInt32
const FLAC__uint64 = UInt64

mutable struct FLAC__Subframe_Constant
    value::FLAC__int32
end

mutable struct FLAC__Subframe_Verbatim
    data::Ptr{FLAC__int32}
end

struct Array_4_FLAC__int32
    d1::FLAC__int32
    d2::FLAC__int32
    d3::FLAC__int32
    d4::FLAC__int32
end

zero(::Type{Array_4_FLAC__int32}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_4_FLAC__int32(fill(zero(FLAC__int32),4)...)
    end

mutable struct FLAC__Subframe_Fixed
    entropy_coding_method::FLAC__EntropyCodingMethod
    order::UInt32
    warmup::Array_4_FLAC__int32
    residual::Ptr{FLAC__int32}
end

struct Array_32_FLAC__int32
    d1::FLAC__int32
    d2::FLAC__int32
    d3::FLAC__int32
    d4::FLAC__int32
    d5::FLAC__int32
    d6::FLAC__int32
    d7::FLAC__int32
    d8::FLAC__int32
    d9::FLAC__int32
    d10::FLAC__int32
    d11::FLAC__int32
    d12::FLAC__int32
    d13::FLAC__int32
    d14::FLAC__int32
    d15::FLAC__int32
    d16::FLAC__int32
    d17::FLAC__int32
    d18::FLAC__int32
    d19::FLAC__int32
    d20::FLAC__int32
    d21::FLAC__int32
    d22::FLAC__int32
    d23::FLAC__int32
    d24::FLAC__int32
    d25::FLAC__int32
    d26::FLAC__int32
    d27::FLAC__int32
    d28::FLAC__int32
    d29::FLAC__int32
    d30::FLAC__int32
    d31::FLAC__int32
    d32::FLAC__int32
end

zero(::Type{Array_32_FLAC__int32}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_32_FLAC__int32(fill(zero(FLAC__int32),32)...)
    end

mutable struct FLAC__Subframe_LPC
    entropy_coding_method::FLAC__EntropyCodingMethod
    order::UInt32
    qlp_coeff_precision::UInt32
    quantization_level::Cint
    qlp_coeff::Array_32_FLAC__int32
    warmup::Array_32_FLAC__int32
    residual::Ptr{FLAC__int32}
end

mutable struct FLAC__Subframe
    _type::FLAC__SubframeType
    data::Void
    wasted_bits::UInt32
end

# begin enum ANONYMOUS_3
const ANONYMOUS_3 = UInt32
const FLAC__CHANNEL_ASSIGNMENT_INDEPENDENT = (UInt32)(0)
const FLAC__CHANNEL_ASSIGNMENT_LEFT_SIDE = (UInt32)(1)
const FLAC__CHANNEL_ASSIGNMENT_RIGHT_SIDE = (UInt32)(2)
const FLAC__CHANNEL_ASSIGNMENT_MID_SIDE = (UInt32)(3)
# end enum ANONYMOUS_3

# begin enum FLAC__ChannelAssignment
const FLAC__ChannelAssignment = UInt32
const FLAC__CHANNEL_ASSIGNMENT_INDEPENDENT = (UInt32)(0)
const FLAC__CHANNEL_ASSIGNMENT_LEFT_SIDE = (UInt32)(1)
const FLAC__CHANNEL_ASSIGNMENT_RIGHT_SIDE = (UInt32)(2)
const FLAC__CHANNEL_ASSIGNMENT_MID_SIDE = (UInt32)(3)
# end enum FLAC__ChannelAssignment

# begin enum ANONYMOUS_4
const ANONYMOUS_4 = UInt32
const FLAC__FRAME_NUMBER_TYPE_FRAME_NUMBER = (UInt32)(0)
const FLAC__FRAME_NUMBER_TYPE_SAMPLE_NUMBER = (UInt32)(1)
# end enum ANONYMOUS_4

# begin enum FLAC__FrameNumberType
const FLAC__FrameNumberType = UInt32
const FLAC__FRAME_NUMBER_TYPE_FRAME_NUMBER = (UInt32)(0)
const FLAC__FRAME_NUMBER_TYPE_SAMPLE_NUMBER = (UInt32)(1)
# end enum FLAC__FrameNumberType

mutable struct FLAC__FrameHeader
    blocksize::UInt32
    sample_rate::UInt32
    channels::UInt32
    channel_assignment::FLAC__ChannelAssignment
    bits_per_sample::UInt32
    number_type::FLAC__FrameNumberType
    number::Void
    crc::FLAC__UInt8
end

mutable struct FLAC__FrameFooter
    crc::FLAC__UInt16
end

struct Array_8_FLAC__Subframe
    d1::FLAC__Subframe
    d2::FLAC__Subframe
    d3::FLAC__Subframe
    d4::FLAC__Subframe
    d5::FLAC__Subframe
    d6::FLAC__Subframe
    d7::FLAC__Subframe
    d8::FLAC__Subframe
end

zero(::Type{Array_8_FLAC__Subframe}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_8_FLAC__Subframe(fill(zero(FLAC__Subframe),8)...)
    end

mutable struct FLAC__Frame
    header::FLAC__FrameHeader
    subframes::Array_8_FLAC__Subframe
    footer::FLAC__FrameFooter
end

# begin enum ANONYMOUS_5
const ANONYMOUS_5 = UInt32
const FLAC__METADATA_TYPE_STREAMINFO = (UInt32)(0)
const FLAC__METADATA_TYPE_PADDING = (UInt32)(1)
const FLAC__METADATA_TYPE_APPLICATION = (UInt32)(2)
const FLAC__METADATA_TYPE_SEEKTABLE = (UInt32)(3)
const FLAC__METADATA_TYPE_VORBIS_COMMENT = (UInt32)(4)
const FLAC__METADATA_TYPE_CUESHEET = (UInt32)(5)
const FLAC__METADATA_TYPE_PICTURE = (UInt32)(6)
const FLAC__METADATA_TYPE_UNDEFINED = (UInt32)(7)
const FLAC__MAX_METADATA_TYPE = (UInt32)(126)
# end enum ANONYMOUS_5

# begin enum FLAC__MetadataType
const FLAC__MetadataType = UInt32
const FLAC__METADATA_TYPE_STREAMINFO = (UInt32)(0)
const FLAC__METADATA_TYPE_PADDING = (UInt32)(1)
const FLAC__METADATA_TYPE_APPLICATION = (UInt32)(2)
const FLAC__METADATA_TYPE_SEEKTABLE = (UInt32)(3)
const FLAC__METADATA_TYPE_VORBIS_COMMENT = (UInt32)(4)
const FLAC__METADATA_TYPE_CUESHEET = (UInt32)(5)
const FLAC__METADATA_TYPE_PICTURE = (UInt32)(6)
const FLAC__METADATA_TYPE_UNDEFINED = (UInt32)(7)
const FLAC__MAX_METADATA_TYPE = (UInt32)(126)
# end enum FLAC__MetadataType

struct Array_16_FLAC__byte
    d1::FLAC__byte
    d2::FLAC__byte
    d3::FLAC__byte
    d4::FLAC__byte
    d5::FLAC__byte
    d6::FLAC__byte
    d7::FLAC__byte
    d8::FLAC__byte
    d9::FLAC__byte
    d10::FLAC__byte
    d11::FLAC__byte
    d12::FLAC__byte
    d13::FLAC__byte
    d14::FLAC__byte
    d15::FLAC__byte
    d16::FLAC__byte
end

zero(::Type{Array_16_FLAC__byte}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_16_FLAC__byte(fill(zero(FLAC__byte),16)...)
    end

mutable struct FLAC__StreamMetadata_StreamInfo
    min_blocksize::UInt32
    max_blocksize::UInt32
    min_framesize::UInt32
    max_framesize::UInt32
    sample_rate::UInt32
    channels::UInt32
    bits_per_sample::UInt32
    total_samples::FLAC__uint64
    md5sum::Array_16_FLAC__byte
end

mutable struct FLAC__StreamMetadata_Padding
    dummy::Cint
end

struct Array_4_FLAC__byte
    d1::FLAC__byte
    d2::FLAC__byte
    d3::FLAC__byte
    d4::FLAC__byte
end

zero(::Type{Array_4_FLAC__byte}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_4_FLAC__byte(fill(zero(FLAC__byte),4)...)
    end

mutable struct FLAC__StreamMetadata_Application
    id::Array_4_FLAC__byte
    data::Ptr{FLAC__byte}
end

mutable struct FLAC__StreamMetadata_SeekPoint
    sample_number::FLAC__uint64
    stream_offset::FLAC__uint64
    frame_samples::UInt32
end

mutable struct FLAC__StreamMetadata_SeekTable
    num_points::UInt32
    points::Ptr{FLAC__StreamMetadata_SeekPoint}
end

mutable struct FLAC__StreamMetadata_VorbisComment_Entry
    length::FLAC__UInt32
    entry::Ptr{FLAC__byte}
end

mutable struct FLAC__StreamMetadata_VorbisComment
    vendor_string::FLAC__StreamMetadata_VorbisComment_Entry
    num_comments::FLAC__UInt32
    comments::Ptr{FLAC__StreamMetadata_VorbisComment_Entry}
end

mutable struct FLAC__StreamMetadata_CueSheet_Index
    offset::FLAC__uint64
    number::FLAC__byte
end

struct Array_13_UInt8
    d1::UInt8
    d2::UInt8
    d3::UInt8
    d4::UInt8
    d5::UInt8
    d6::UInt8
    d7::UInt8
    d8::UInt8
    d9::UInt8
    d10::UInt8
    d11::UInt8
    d12::UInt8
    d13::UInt8
end

zero(::Type{Array_13_UInt8}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_13_UInt8(fill(zero(UInt8),13)...)
    end

mutable struct FLAC__StreamMetadata_CueSheet_Track
    offset::FLAC__uint64
    number::FLAC__byte
    isrc::Array_13_UInt8
    _type::UInt32
    pre_emphasis::UInt32
    num_indices::FLAC__byte
    indices::Ptr{FLAC__StreamMetadata_CueSheet_Index}
end

struct Array_129_UInt8
    d1::UInt8
    d2::UInt8
    d3::UInt8
    d4::UInt8
    d5::UInt8
    d6::UInt8
    d7::UInt8
    d8::UInt8
    d9::UInt8
    d10::UInt8
    d11::UInt8
    d12::UInt8
    d13::UInt8
    d14::UInt8
    d15::UInt8
    d16::UInt8
    d17::UInt8
    d18::UInt8
    d19::UInt8
    d20::UInt8
    d21::UInt8
    d22::UInt8
    d23::UInt8
    d24::UInt8
    d25::UInt8
    d26::UInt8
    d27::UInt8
    d28::UInt8
    d29::UInt8
    d30::UInt8
    d31::UInt8
    d32::UInt8
    d33::UInt8
    d34::UInt8
    d35::UInt8
    d36::UInt8
    d37::UInt8
    d38::UInt8
    d39::UInt8
    d40::UInt8
    d41::UInt8
    d42::UInt8
    d43::UInt8
    d44::UInt8
    d45::UInt8
    d46::UInt8
    d47::UInt8
    d48::UInt8
    d49::UInt8
    d50::UInt8
    d51::UInt8
    d52::UInt8
    d53::UInt8
    d54::UInt8
    d55::UInt8
    d56::UInt8
    d57::UInt8
    d58::UInt8
    d59::UInt8
    d60::UInt8
    d61::UInt8
    d62::UInt8
    d63::UInt8
    d64::UInt8
    d65::UInt8
    d66::UInt8
    d67::UInt8
    d68::UInt8
    d69::UInt8
    d70::UInt8
    d71::UInt8
    d72::UInt8
    d73::UInt8
    d74::UInt8
    d75::UInt8
    d76::UInt8
    d77::UInt8
    d78::UInt8
    d79::UInt8
    d80::UInt8
    d81::UInt8
    d82::UInt8
    d83::UInt8
    d84::UInt8
    d85::UInt8
    d86::UInt8
    d87::UInt8
    d88::UInt8
    d89::UInt8
    d90::UInt8
    d91::UInt8
    d92::UInt8
    d93::UInt8
    d94::UInt8
    d95::UInt8
    d96::UInt8
    d97::UInt8
    d98::UInt8
    d99::UInt8
    d100::UInt8
    d101::UInt8
    d102::UInt8
    d103::UInt8
    d104::UInt8
    d105::UInt8
    d106::UInt8
    d107::UInt8
    d108::UInt8
    d109::UInt8
    d110::UInt8
    d111::UInt8
    d112::UInt8
    d113::UInt8
    d114::UInt8
    d115::UInt8
    d116::UInt8
    d117::UInt8
    d118::UInt8
    d119::UInt8
    d120::UInt8
    d121::UInt8
    d122::UInt8
    d123::UInt8
    d124::UInt8
    d125::UInt8
    d126::UInt8
    d127::UInt8
    d128::UInt8
    d129::UInt8
end

zero(::Type{Array_129_UInt8}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_129_UInt8(fill(zero(UInt8),129)...)
    end

mutable struct FLAC__StreamMetadata_CueSheet
    media_catalog_number::Array_129_UInt8
    lead_in::FLAC__uint64
    is_cd::FLAC__bool
    num_tracks::UInt32
    tracks::Ptr{FLAC__StreamMetadata_CueSheet_Track}
end

# begin enum ANONYMOUS_6
const ANONYMOUS_6 = UInt32
const FLAC__STREAM_METADATA_PICTURE_TYPE_OTHER = (UInt32)(0)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON_STANDARD = (UInt32)(1)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON = (UInt32)(2)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FRONT_COVER = (UInt32)(3)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BACK_COVER = (UInt32)(4)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAFLET_PAGE = (UInt32)(5)
const FLAC__STREAM_METADATA_PICTURE_TYPE_MEDIA = (UInt32)(6)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAD_ARTIST = (UInt32)(7)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ARTIST = (UInt32)(8)
const FLAC__STREAM_METADATA_PICTURE_TYPE_CONDUCTOR = (UInt32)(9)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND = (UInt32)(10)
const FLAC__STREAM_METADATA_PICTURE_TYPE_COMPOSER = (UInt32)(11)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LYRICIST = (UInt32)(12)
const FLAC__STREAM_METADATA_PICTURE_TYPE_RECORDING_LOCATION = (UInt32)(13)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_RECORDING = (UInt32)(14)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_PERFORMANCE = (UInt32)(15)
const FLAC__STREAM_METADATA_PICTURE_TYPE_VIDEO_SCREEN_CAPTURE = (UInt32)(16)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FISH = (UInt32)(17)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ILLUSTRATION = (UInt32)(18)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND_LOGOTYPE = (UInt32)(19)
const FLAC__STREAM_METADATA_PICTURE_TYPE_PUBLISHER_LOGOTYPE = (UInt32)(20)
const FLAC__STREAM_METADATA_PICTURE_TYPE_UNDEFINED = (UInt32)(21)
# end enum ANONYMOUS_6

# begin enum FLAC__StreamMetadata_Picture_Type
const FLAC__StreamMetadata_Picture_Type = UInt32
const FLAC__STREAM_METADATA_PICTURE_TYPE_OTHER = (UInt32)(0)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON_STANDARD = (UInt32)(1)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON = (UInt32)(2)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FRONT_COVER = (UInt32)(3)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BACK_COVER = (UInt32)(4)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAFLET_PAGE = (UInt32)(5)
const FLAC__STREAM_METADATA_PICTURE_TYPE_MEDIA = (UInt32)(6)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAD_ARTIST = (UInt32)(7)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ARTIST = (UInt32)(8)
const FLAC__STREAM_METADATA_PICTURE_TYPE_CONDUCTOR = (UInt32)(9)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND = (UInt32)(10)
const FLAC__STREAM_METADATA_PICTURE_TYPE_COMPOSER = (UInt32)(11)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LYRICIST = (UInt32)(12)
const FLAC__STREAM_METADATA_PICTURE_TYPE_RECORDING_LOCATION = (UInt32)(13)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_RECORDING = (UInt32)(14)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_PERFORMANCE = (UInt32)(15)
const FLAC__STREAM_METADATA_PICTURE_TYPE_VIDEO_SCREEN_CAPTURE = (UInt32)(16)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FISH = (UInt32)(17)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ILLUSTRATION = (UInt32)(18)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND_LOGOTYPE = (UInt32)(19)
const FLAC__STREAM_METADATA_PICTURE_TYPE_PUBLISHER_LOGOTYPE = (UInt32)(20)
const FLAC__STREAM_METADATA_PICTURE_TYPE_UNDEFINED = (UInt32)(21)
# end enum FLAC__StreamMetadata_Picture_Type

mutable struct FLAC__StreamMetadata_Picture
    _type::FLAC__StreamMetadata_Picture_Type
    mime_type::Ptr{UInt8}
    description::Ptr{FLAC__byte}
    width::FLAC__UInt32
    height::FLAC__UInt32
    depth::FLAC__UInt32
    colors::FLAC__UInt32
    data_length::FLAC__UInt32
    data::Ptr{FLAC__byte}
end

mutable struct FLAC__StreamMetadata_Unknown
    data::Ptr{FLAC__byte}
end

mutable struct FLAC__StreamMetadata
    _type::FLAC__MetadataType
    is_last::FLAC__bool
    length::UInt32
    data::Void
end

# begin enum ANONYMOUS_7
const ANONYMOUS_7 = UInt32
const FLAC__STREAM_DECODER_SEARCH_FOR_METADATA = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_METADATA = (UInt32)(1)
const FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC = (UInt32)(2)
const FLAC__STREAM_DECODER_READ_FRAME = (UInt32)(3)
const FLAC__STREAM_DECODER_END_OF_STREAM = (UInt32)(4)
const FLAC__STREAM_DECODER_OGG_ERROR = (UInt32)(5)
const FLAC__STREAM_DECODER_SEEK_ERROR = (UInt32)(6)
const FLAC__STREAM_DECODER_ABORTED = (UInt32)(7)
const FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
const FLAC__STREAM_DECODER_UNINITIALIZED = (UInt32)(9)
# end enum ANONYMOUS_7

# begin enum FLAC__StreamDecoderState
const FLAC__StreamDecoderState = UInt32
const FLAC__STREAM_DECODER_SEARCH_FOR_METADATA = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_METADATA = (UInt32)(1)
const FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC = (UInt32)(2)
const FLAC__STREAM_DECODER_READ_FRAME = (UInt32)(3)
const FLAC__STREAM_DECODER_END_OF_STREAM = (UInt32)(4)
const FLAC__STREAM_DECODER_OGG_ERROR = (UInt32)(5)
const FLAC__STREAM_DECODER_SEEK_ERROR = (UInt32)(6)
const FLAC__STREAM_DECODER_ABORTED = (UInt32)(7)
const FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
const FLAC__STREAM_DECODER_UNINITIALIZED = (UInt32)(9)
# end enum FLAC__StreamDecoderState

# begin enum ANONYMOUS_8
const ANONYMOUS_8 = UInt32
const FLAC__STREAM_DECODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(1)
const FLAC__STREAM_DECODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(2)
const FLAC__STREAM_DECODER_INIT_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(3)
const FLAC__STREAM_DECODER_INIT_STATUS_ERROR_OPENING_FILE = (UInt32)(4)
const FLAC__STREAM_DECODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(5)
# end enum ANONYMOUS_8

# begin enum FLAC__StreamDecoderInitStatus
const FLAC__StreamDecoderInitStatus = UInt32
const FLAC__STREAM_DECODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(1)
const FLAC__STREAM_DECODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(2)
const FLAC__STREAM_DECODER_INIT_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(3)
const FLAC__STREAM_DECODER_INIT_STATUS_ERROR_OPENING_FILE = (UInt32)(4)
const FLAC__STREAM_DECODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(5)
# end enum FLAC__StreamDecoderInitStatus

# begin enum ANONYMOUS_9
const ANONYMOUS_9 = UInt32
const FLAC__STREAM_DECODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_DECODER_READ_STATUS_ABORT = (UInt32)(2)
# end enum ANONYMOUS_9

# begin enum FLAC__StreamDecoderReadStatus
const FLAC__StreamDecoderReadStatus = UInt32
const FLAC__STREAM_DECODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_DECODER_READ_STATUS_ABORT = (UInt32)(2)
# end enum FLAC__StreamDecoderReadStatus

# begin enum ANONYMOUS_10
const ANONYMOUS_10 = UInt32
const FLAC__STREAM_DECODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_10

# begin enum FLAC__StreamDecoderSeekStatus
const FLAC__StreamDecoderSeekStatus = UInt32
const FLAC__STREAM_DECODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum FLAC__StreamDecoderSeekStatus

# begin enum ANONYMOUS_11
const ANONYMOUS_11 = UInt32
const FLAC__STREAM_DECODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_11

# begin enum FLAC__StreamDecoderTellStatus
const FLAC__StreamDecoderTellStatus = UInt32
const FLAC__STREAM_DECODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum FLAC__StreamDecoderTellStatus

# begin enum ANONYMOUS_12
const ANONYMOUS_12 = UInt32
const FLAC__STREAM_DECODER_LENGTH_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_LENGTH_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_LENGTH_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_12

# begin enum FLAC__StreamDecoderLengthStatus
const FLAC__StreamDecoderLengthStatus = UInt32
const FLAC__STREAM_DECODER_LENGTH_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_LENGTH_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_LENGTH_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum FLAC__StreamDecoderLengthStatus

# begin enum ANONYMOUS_13
const ANONYMOUS_13 = UInt32
const FLAC__STREAM_DECODER_WRITE_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_WRITE_STATUS_ABORT = (UInt32)(1)
# end enum ANONYMOUS_13

# begin enum FLAC__StreamDecoderWriteStatus
const FLAC__StreamDecoderWriteStatus = UInt32
const FLAC__STREAM_DECODER_WRITE_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_WRITE_STATUS_ABORT = (UInt32)(1)
# end enum FLAC__StreamDecoderWriteStatus

# begin enum ANONYMOUS_14
const ANONYMOUS_14 = UInt32
const FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC = (UInt32)(0)
const FLAC__STREAM_DECODER_ERROR_STATUS_BAD_HEADER = (UInt32)(1)
const FLAC__STREAM_DECODER_ERROR_STATUS_FRAME_CRC_MISMATCH = (UInt32)(2)
const FLAC__STREAM_DECODER_ERROR_STATUS_UNPARSEABLE_STREAM = (UInt32)(3)
# end enum ANONYMOUS_14

# begin enum FLAC__StreamDecoderErrorStatus
const FLAC__StreamDecoderErrorStatus = UInt32
const FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC = (UInt32)(0)
const FLAC__STREAM_DECODER_ERROR_STATUS_BAD_HEADER = (UInt32)(1)
const FLAC__STREAM_DECODER_ERROR_STATUS_FRAME_CRC_MISMATCH = (UInt32)(2)
const FLAC__STREAM_DECODER_ERROR_STATUS_UNPARSEABLE_STREAM = (UInt32)(3)
# end enum FLAC__StreamDecoderErrorStatus

mutable struct FLAC__StreamDecoderProtected
end

mutable struct FLAC__StreamDecoderPrivate
end

mutable struct FLAC__StreamDecoder
    protected_::Ptr{FLAC__StreamDecoderProtected}
    private_::Ptr{FLAC__StreamDecoderPrivate}
end

const FLAC__StreamDecoderReadCallback = Ptr{Void}
const FLAC__StreamDecoderSeekCallback = Ptr{Void}
const FLAC__StreamDecoderTellCallback = Ptr{Void}
const FLAC__StreamDecoderLengthCallback = Ptr{Void}
const FLAC__StreamDecoderEofCallback = Ptr{Void}
const FLAC__StreamDecoderWriteCallback = Ptr{Void}
const FLAC__StreamDecoderMetadataCallback = Ptr{Void}
const FLAC__StreamDecoderErrorCallback = Ptr{Void}

# begin enum ANONYMOUS_15
const ANONYMOUS_15 = UInt32
const FLAC__STREAM_ENCODER_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_UNINITIALIZED = (UInt32)(1)
const FLAC__STREAM_ENCODER_OGG_ERROR = (UInt32)(2)
const FLAC__STREAM_ENCODER_VERIFY_DECODER_ERROR = (UInt32)(3)
const FLAC__STREAM_ENCODER_VERIFY_MISMATCH_IN_AUDIO_DATA = (UInt32)(4)
const FLAC__STREAM_ENCODER_CLIENT_ERROR = (UInt32)(5)
const FLAC__STREAM_ENCODER_IO_ERROR = (UInt32)(6)
const FLAC__STREAM_ENCODER_FRAMING_ERROR = (UInt32)(7)
const FLAC__STREAM_ENCODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
# end enum ANONYMOUS_15

# begin enum FLAC__StreamEncoderState
const FLAC__StreamEncoderState = UInt32
const FLAC__STREAM_ENCODER_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_UNINITIALIZED = (UInt32)(1)
const FLAC__STREAM_ENCODER_OGG_ERROR = (UInt32)(2)
const FLAC__STREAM_ENCODER_VERIFY_DECODER_ERROR = (UInt32)(3)
const FLAC__STREAM_ENCODER_VERIFY_MISMATCH_IN_AUDIO_DATA = (UInt32)(4)
const FLAC__STREAM_ENCODER_CLIENT_ERROR = (UInt32)(5)
const FLAC__STREAM_ENCODER_IO_ERROR = (UInt32)(6)
const FLAC__STREAM_ENCODER_FRAMING_ERROR = (UInt32)(7)
const FLAC__STREAM_ENCODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
# end enum FLAC__StreamEncoderState

# begin enum ANONYMOUS_16
const ANONYMOUS_16 = UInt32
const FLAC__STREAM_ENCODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_INIT_STATUS_ENCODER_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(2)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(3)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_NUMBER_OF_CHANNELS = (UInt32)(4)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BITS_PER_SAMPLE = (UInt32)(5)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_SAMPLE_RATE = (UInt32)(6)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BLOCK_SIZE = (UInt32)(7)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_MAX_LPC_ORDER = (UInt32)(8)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_QLP_COEFF_PRECISION = (UInt32)(9)
const FLAC__STREAM_ENCODER_INIT_STATUS_BLOCK_SIZE_TOO_SMALL_FOR_LPC_ORDER = (UInt32)(10)
const FLAC__STREAM_ENCODER_INIT_STATUS_NOT_STREAMABLE = (UInt32)(11)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_METADATA = (UInt32)(12)
const FLAC__STREAM_ENCODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(13)
# end enum ANONYMOUS_16

# begin enum FLAC__StreamEncoderInitStatus
const FLAC__StreamEncoderInitStatus = UInt32
const FLAC__STREAM_ENCODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_INIT_STATUS_ENCODER_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(2)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(3)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_NUMBER_OF_CHANNELS = (UInt32)(4)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BITS_PER_SAMPLE = (UInt32)(5)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_SAMPLE_RATE = (UInt32)(6)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BLOCK_SIZE = (UInt32)(7)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_MAX_LPC_ORDER = (UInt32)(8)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_QLP_COEFF_PRECISION = (UInt32)(9)
const FLAC__STREAM_ENCODER_INIT_STATUS_BLOCK_SIZE_TOO_SMALL_FOR_LPC_ORDER = (UInt32)(10)
const FLAC__STREAM_ENCODER_INIT_STATUS_NOT_STREAMABLE = (UInt32)(11)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_METADATA = (UInt32)(12)
const FLAC__STREAM_ENCODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(13)
# end enum FLAC__StreamEncoderInitStatus

# begin enum ANONYMOUS_17
const ANONYMOUS_17 = UInt32
const FLAC__STREAM_ENCODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_ENCODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_ENCODER_READ_STATUS_ABORT = (UInt32)(2)
const FLAC__STREAM_ENCODER_READ_STATUS_UNSUPPORTED = (UInt32)(3)
# end enum ANONYMOUS_17

# begin enum FLAC__StreamEncoderReadStatus
const FLAC__StreamEncoderReadStatus = UInt32
const FLAC__STREAM_ENCODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_ENCODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_ENCODER_READ_STATUS_ABORT = (UInt32)(2)
const FLAC__STREAM_ENCODER_READ_STATUS_UNSUPPORTED = (UInt32)(3)
# end enum FLAC__StreamEncoderReadStatus

# begin enum ANONYMOUS_18
const ANONYMOUS_18 = UInt32
const FLAC__STREAM_ENCODER_WRITE_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_WRITE_STATUS_FATAL_ERROR = (UInt32)(1)
# end enum ANONYMOUS_18

# begin enum FLAC__StreamEncoderWriteStatus
const FLAC__StreamEncoderWriteStatus = UInt32
const FLAC__STREAM_ENCODER_WRITE_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_WRITE_STATUS_FATAL_ERROR = (UInt32)(1)
# end enum FLAC__StreamEncoderWriteStatus

# begin enum ANONYMOUS_19
const ANONYMOUS_19 = UInt32
const FLAC__STREAM_ENCODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_19

# begin enum FLAC__StreamEncoderSeekStatus
const FLAC__StreamEncoderSeekStatus = UInt32
const FLAC__STREAM_ENCODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum FLAC__StreamEncoderSeekStatus

# begin enum ANONYMOUS_20
const ANONYMOUS_20 = UInt32
const FLAC__STREAM_ENCODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_20

# begin enum FLAC__StreamEncoderTellStatus
const FLAC__StreamEncoderTellStatus = UInt32
const FLAC__STREAM_ENCODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum FLAC__StreamEncoderTellStatus

mutable struct FLAC__StreamEncoderProtected
end

mutable struct FLAC__StreamEncoderPrivate
end

mutable struct FLAC__StreamEncoder
    protected_::Ptr{FLAC__StreamEncoderProtected}
    private_::Ptr{FLAC__StreamEncoderPrivate}
end

const FLAC__StreamEncoderReadCallback = Ptr{Void}
const FLAC__StreamEncoderWriteCallback = Ptr{Void}
const FLAC__StreamEncoderSeekCallback = Ptr{Void}
const FLAC__StreamEncoderTellCallback = Ptr{Void}
const FLAC__StreamEncoderMetadataCallback = Ptr{Void}
const FLAC__StreamEncoderProgressCallback = Ptr{Void}

# begin enum ANONYMOUS_21
const ANONYMOUS_21 = UInt32
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE = (UInt32)(0)
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE2 = (UInt32)(1)
# end enum ANONYMOUS_21

# begin enum ANONYMOUS_22
const ANONYMOUS_22 = UInt32
const FLAC__SUBFRAME_TYPE_CONSTANT = (UInt32)(0)
const FLAC__SUBFRAME_TYPE_VERBATIM = (UInt32)(1)
const FLAC__SUBFRAME_TYPE_FIXED = (UInt32)(2)
const FLAC__SUBFRAME_TYPE_LPC = (UInt32)(3)
# end enum ANONYMOUS_22

# begin enum ANONYMOUS_23
const ANONYMOUS_23 = UInt32
const FLAC__CHANNEL_ASSIGNMENT_INDEPENDENT = (UInt32)(0)
const FLAC__CHANNEL_ASSIGNMENT_LEFT_SIDE = (UInt32)(1)
const FLAC__CHANNEL_ASSIGNMENT_RIGHT_SIDE = (UInt32)(2)
const FLAC__CHANNEL_ASSIGNMENT_MID_SIDE = (UInt32)(3)
# end enum ANONYMOUS_23

# begin enum ANONYMOUS_24
const ANONYMOUS_24 = UInt32
const FLAC__FRAME_NUMBER_TYPE_FRAME_NUMBER = (UInt32)(0)
const FLAC__FRAME_NUMBER_TYPE_SAMPLE_NUMBER = (UInt32)(1)
# end enum ANONYMOUS_24

# begin enum ANONYMOUS_25
const ANONYMOUS_25 = UInt32
const FLAC__METADATA_TYPE_STREAMINFO = (UInt32)(0)
const FLAC__METADATA_TYPE_PADDING = (UInt32)(1)
const FLAC__METADATA_TYPE_APPLICATION = (UInt32)(2)
const FLAC__METADATA_TYPE_SEEKTABLE = (UInt32)(3)
const FLAC__METADATA_TYPE_VORBIS_COMMENT = (UInt32)(4)
const FLAC__METADATA_TYPE_CUESHEET = (UInt32)(5)
const FLAC__METADATA_TYPE_PICTURE = (UInt32)(6)
const FLAC__METADATA_TYPE_UNDEFINED = (UInt32)(7)
const FLAC__MAX_METADATA_TYPE = (UInt32)(126)
# end enum ANONYMOUS_25

# begin enum ANONYMOUS_26
const ANONYMOUS_26 = UInt32
const FLAC__STREAM_METADATA_PICTURE_TYPE_OTHER = (UInt32)(0)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON_STANDARD = (UInt32)(1)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON = (UInt32)(2)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FRONT_COVER = (UInt32)(3)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BACK_COVER = (UInt32)(4)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAFLET_PAGE = (UInt32)(5)
const FLAC__STREAM_METADATA_PICTURE_TYPE_MEDIA = (UInt32)(6)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAD_ARTIST = (UInt32)(7)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ARTIST = (UInt32)(8)
const FLAC__STREAM_METADATA_PICTURE_TYPE_CONDUCTOR = (UInt32)(9)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND = (UInt32)(10)
const FLAC__STREAM_METADATA_PICTURE_TYPE_COMPOSER = (UInt32)(11)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LYRICIST = (UInt32)(12)
const FLAC__STREAM_METADATA_PICTURE_TYPE_RECORDING_LOCATION = (UInt32)(13)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_RECORDING = (UInt32)(14)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_PERFORMANCE = (UInt32)(15)
const FLAC__STREAM_METADATA_PICTURE_TYPE_VIDEO_SCREEN_CAPTURE = (UInt32)(16)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FISH = (UInt32)(17)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ILLUSTRATION = (UInt32)(18)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND_LOGOTYPE = (UInt32)(19)
const FLAC__STREAM_METADATA_PICTURE_TYPE_PUBLISHER_LOGOTYPE = (UInt32)(20)
const FLAC__STREAM_METADATA_PICTURE_TYPE_UNDEFINED = (UInt32)(21)
# end enum ANONYMOUS_26

# begin enum ANONYMOUS_27
const ANONYMOUS_27 = UInt32
const FLAC__STREAM_DECODER_SEARCH_FOR_METADATA = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_METADATA = (UInt32)(1)
const FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC = (UInt32)(2)
const FLAC__STREAM_DECODER_READ_FRAME = (UInt32)(3)
const FLAC__STREAM_DECODER_END_OF_STREAM = (UInt32)(4)
const FLAC__STREAM_DECODER_OGG_ERROR = (UInt32)(5)
const FLAC__STREAM_DECODER_SEEK_ERROR = (UInt32)(6)
const FLAC__STREAM_DECODER_ABORTED = (UInt32)(7)
const FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
const FLAC__STREAM_DECODER_UNINITIALIZED = (UInt32)(9)
# end enum ANONYMOUS_27

# begin enum ANONYMOUS_28
const ANONYMOUS_28 = UInt32
const FLAC__STREAM_DECODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(1)
const FLAC__STREAM_DECODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(2)
const FLAC__STREAM_DECODER_INIT_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(3)
const FLAC__STREAM_DECODER_INIT_STATUS_ERROR_OPENING_FILE = (UInt32)(4)
const FLAC__STREAM_DECODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(5)
# end enum ANONYMOUS_28

# begin enum ANONYMOUS_29
const ANONYMOUS_29 = UInt32
const FLAC__STREAM_DECODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_DECODER_READ_STATUS_ABORT = (UInt32)(2)
# end enum ANONYMOUS_29

# begin enum ANONYMOUS_30
const ANONYMOUS_30 = UInt32
const FLAC__STREAM_DECODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_30

# begin enum ANONYMOUS_31
const ANONYMOUS_31 = UInt32
const FLAC__STREAM_DECODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_31

# begin enum ANONYMOUS_32
const ANONYMOUS_32 = UInt32
const FLAC__STREAM_DECODER_LENGTH_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_LENGTH_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_LENGTH_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_32

# begin enum ANONYMOUS_33
const ANONYMOUS_33 = UInt32
const FLAC__STREAM_DECODER_WRITE_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_WRITE_STATUS_ABORT = (UInt32)(1)
# end enum ANONYMOUS_33

# begin enum ANONYMOUS_34
const ANONYMOUS_34 = UInt32
const FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC = (UInt32)(0)
const FLAC__STREAM_DECODER_ERROR_STATUS_BAD_HEADER = (UInt32)(1)
const FLAC__STREAM_DECODER_ERROR_STATUS_FRAME_CRC_MISMATCH = (UInt32)(2)
const FLAC__STREAM_DECODER_ERROR_STATUS_UNPARSEABLE_STREAM = (UInt32)(3)
# end enum ANONYMOUS_34

const ogg_int16_t = Int16
const ogg_UInt16_t = UInt16
const ogg_int32_t = Int32
const ogg_UInt32_t = UInt32
const ogg_int64_t = Int64

mutable struct ogg_iovec_t
    iov_base::Ptr{Void}
    iov_len::Cint
end

mutable struct oggpack_buffer
    endbyte::Clong
    endbit::Cint
    buffer::Ptr{Cuchar}
    ptr::Ptr{Cuchar}
    storage::Clong
end

mutable struct ogg_page
    header::Ptr{Cuchar}
    header_len::Clong
    body::Ptr{Cuchar}
    body_len::Clong
end

struct Array_282_Cuchar
    d1::Cuchar
    d2::Cuchar
    d3::Cuchar
    d4::Cuchar
    d5::Cuchar
    d6::Cuchar
    d7::Cuchar
    d8::Cuchar
    d9::Cuchar
    d10::Cuchar
    d11::Cuchar
    d12::Cuchar
    d13::Cuchar
    d14::Cuchar
    d15::Cuchar
    d16::Cuchar
    d17::Cuchar
    d18::Cuchar
    d19::Cuchar
    d20::Cuchar
    d21::Cuchar
    d22::Cuchar
    d23::Cuchar
    d24::Cuchar
    d25::Cuchar
    d26::Cuchar
    d27::Cuchar
    d28::Cuchar
    d29::Cuchar
    d30::Cuchar
    d31::Cuchar
    d32::Cuchar
    d33::Cuchar
    d34::Cuchar
    d35::Cuchar
    d36::Cuchar
    d37::Cuchar
    d38::Cuchar
    d39::Cuchar
    d40::Cuchar
    d41::Cuchar
    d42::Cuchar
    d43::Cuchar
    d44::Cuchar
    d45::Cuchar
    d46::Cuchar
    d47::Cuchar
    d48::Cuchar
    d49::Cuchar
    d50::Cuchar
    d51::Cuchar
    d52::Cuchar
    d53::Cuchar
    d54::Cuchar
    d55::Cuchar
    d56::Cuchar
    d57::Cuchar
    d58::Cuchar
    d59::Cuchar
    d60::Cuchar
    d61::Cuchar
    d62::Cuchar
    d63::Cuchar
    d64::Cuchar
    d65::Cuchar
    d66::Cuchar
    d67::Cuchar
    d68::Cuchar
    d69::Cuchar
    d70::Cuchar
    d71::Cuchar
    d72::Cuchar
    d73::Cuchar
    d74::Cuchar
    d75::Cuchar
    d76::Cuchar
    d77::Cuchar
    d78::Cuchar
    d79::Cuchar
    d80::Cuchar
    d81::Cuchar
    d82::Cuchar
    d83::Cuchar
    d84::Cuchar
    d85::Cuchar
    d86::Cuchar
    d87::Cuchar
    d88::Cuchar
    d89::Cuchar
    d90::Cuchar
    d91::Cuchar
    d92::Cuchar
    d93::Cuchar
    d94::Cuchar
    d95::Cuchar
    d96::Cuchar
    d97::Cuchar
    d98::Cuchar
    d99::Cuchar
    d100::Cuchar
    d101::Cuchar
    d102::Cuchar
    d103::Cuchar
    d104::Cuchar
    d105::Cuchar
    d106::Cuchar
    d107::Cuchar
    d108::Cuchar
    d109::Cuchar
    d110::Cuchar
    d111::Cuchar
    d112::Cuchar
    d113::Cuchar
    d114::Cuchar
    d115::Cuchar
    d116::Cuchar
    d117::Cuchar
    d118::Cuchar
    d119::Cuchar
    d120::Cuchar
    d121::Cuchar
    d122::Cuchar
    d123::Cuchar
    d124::Cuchar
    d125::Cuchar
    d126::Cuchar
    d127::Cuchar
    d128::Cuchar
    d129::Cuchar
    d130::Cuchar
    d131::Cuchar
    d132::Cuchar
    d133::Cuchar
    d134::Cuchar
    d135::Cuchar
    d136::Cuchar
    d137::Cuchar
    d138::Cuchar
    d139::Cuchar
    d140::Cuchar
    d141::Cuchar
    d142::Cuchar
    d143::Cuchar
    d144::Cuchar
    d145::Cuchar
    d146::Cuchar
    d147::Cuchar
    d148::Cuchar
    d149::Cuchar
    d150::Cuchar
    d151::Cuchar
    d152::Cuchar
    d153::Cuchar
    d154::Cuchar
    d155::Cuchar
    d156::Cuchar
    d157::Cuchar
    d158::Cuchar
    d159::Cuchar
    d160::Cuchar
    d161::Cuchar
    d162::Cuchar
    d163::Cuchar
    d164::Cuchar
    d165::Cuchar
    d166::Cuchar
    d167::Cuchar
    d168::Cuchar
    d169::Cuchar
    d170::Cuchar
    d171::Cuchar
    d172::Cuchar
    d173::Cuchar
    d174::Cuchar
    d175::Cuchar
    d176::Cuchar
    d177::Cuchar
    d178::Cuchar
    d179::Cuchar
    d180::Cuchar
    d181::Cuchar
    d182::Cuchar
    d183::Cuchar
    d184::Cuchar
    d185::Cuchar
    d186::Cuchar
    d187::Cuchar
    d188::Cuchar
    d189::Cuchar
    d190::Cuchar
    d191::Cuchar
    d192::Cuchar
    d193::Cuchar
    d194::Cuchar
    d195::Cuchar
    d196::Cuchar
    d197::Cuchar
    d198::Cuchar
    d199::Cuchar
    d200::Cuchar
    d201::Cuchar
    d202::Cuchar
    d203::Cuchar
    d204::Cuchar
    d205::Cuchar
    d206::Cuchar
    d207::Cuchar
    d208::Cuchar
    d209::Cuchar
    d210::Cuchar
    d211::Cuchar
    d212::Cuchar
    d213::Cuchar
    d214::Cuchar
    d215::Cuchar
    d216::Cuchar
    d217::Cuchar
    d218::Cuchar
    d219::Cuchar
    d220::Cuchar
    d221::Cuchar
    d222::Cuchar
    d223::Cuchar
    d224::Cuchar
    d225::Cuchar
    d226::Cuchar
    d227::Cuchar
    d228::Cuchar
    d229::Cuchar
    d230::Cuchar
    d231::Cuchar
    d232::Cuchar
    d233::Cuchar
    d234::Cuchar
    d235::Cuchar
    d236::Cuchar
    d237::Cuchar
    d238::Cuchar
    d239::Cuchar
    d240::Cuchar
    d241::Cuchar
    d242::Cuchar
    d243::Cuchar
    d244::Cuchar
    d245::Cuchar
    d246::Cuchar
    d247::Cuchar
    d248::Cuchar
    d249::Cuchar
    d250::Cuchar
    d251::Cuchar
    d252::Cuchar
    d253::Cuchar
    d254::Cuchar
    d255::Cuchar
    d256::Cuchar
    d257::Cuchar
    d258::Cuchar
    d259::Cuchar
    d260::Cuchar
    d261::Cuchar
    d262::Cuchar
    d263::Cuchar
    d264::Cuchar
    d265::Cuchar
    d266::Cuchar
    d267::Cuchar
    d268::Cuchar
    d269::Cuchar
    d270::Cuchar
    d271::Cuchar
    d272::Cuchar
    d273::Cuchar
    d274::Cuchar
    d275::Cuchar
    d276::Cuchar
    d277::Cuchar
    d278::Cuchar
    d279::Cuchar
    d280::Cuchar
    d281::Cuchar
    d282::Cuchar
end

zero(::Type{Array_282_Cuchar}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_282_Cuchar(fill(zero(Cuchar),282)...)
    end

mutable struct ogg_stream_state
    body_data::Ptr{Cuchar}
    body_storage::Clong
    body_fill::Clong
    body_returned::Clong
    lacing_vals::Ptr{Cint}
    granule_vals::Ptr{ogg_int64_t}
    lacing_storage::Clong
    lacing_fill::Clong
    lacing_packet::Clong
    lacing_returned::Clong
    header::Array_282_Cuchar
    header_fill::Cint
    e_o_s::Cint
    b_o_s::Cint
    serialno::Clong
    pageno::Clong
    packetno::ogg_int64_t
    granulepos::ogg_int64_t
end

mutable struct ogg_packet
    packet::Ptr{Cuchar}
    bytes::Clong
    b_o_s::Clong
    e_o_s::Clong
    granulepos::ogg_int64_t
    packetno::ogg_int64_t
end

mutable struct ogg_sync_state
    data::Ptr{Cuchar}
    storage::Cint
    fill::Cint
    returned::Cint
    unsynced::Cint
    headerbytes::Cint
    bodybytes::Cint
end

# begin enum OggzError
const OggzError = Cint
const OGGZ_ERR_OK = (Int32)(0)
const OGGZ_ERR_GENERIC = (Int32)(-1)
const OGGZ_ERR_BAD_OGGZ = (Int32)(-2)
const OGGZ_ERR_INVALID = (Int32)(-3)
const OGGZ_ERR_NO_STREAMS = (Int32)(-4)
const OGGZ_ERR_BOS = (Int32)(-5)
const OGGZ_ERR_EOS = (Int32)(-6)
const OGGZ_ERR_BAD_METRIC = (Int32)(-7)
const OGGZ_ERR_SYSTEM = (Int32)(-10)
const OGGZ_ERR_DISABLED = (Int32)(-11)
const OGGZ_ERR_NOSEEK = (Int32)(-13)
const OGGZ_ERR_STOP_OK = (Int32)(-14)
const OGGZ_ERR_STOP_ERR = (Int32)(-15)
const OGGZ_ERR_IO_AGAIN = (Int32)(-16)
const OGGZ_ERR_HOLE_IN_DATA = (Int32)(-17)
const OGGZ_ERR_OUT_OF_MEMORY = (Int32)(-18)
const OGGZ_ERR_BAD_SERIALNO = (Int32)(-20)
const OGGZ_ERR_BAD_BYTES = (Int32)(-21)
const OGGZ_ERR_BAD_B_O_S = (Int32)(-22)
const OGGZ_ERR_BAD_E_O_S = (Int32)(-23)
const OGGZ_ERR_BAD_GRANULEPOS = (Int32)(-24)
const OGGZ_ERR_BAD_PACKETNO = (Int32)(-25)
const OGGZ_ERR_COMMENT_INVALID = (Int32)(-129)
const OGGZ_ERR_BAD_GUARD = (Int32)(-210)
const OGGZ_ERR_RECURSIVE_WRITE = (Int32)(-266)
# end enum OggzError

const OGGZ_ERR_USER_STOPPED = OGGZ_ERR_STOP_OK
const OGGZ_ERR_READ_STOP_OK = OGGZ_ERR_STOP_OK
const OGGZ_ERR_READ_STOP_ERR = OGGZ_ERR_STOP_ERR

# begin enum OggzFlags
const OggzFlags = UInt32
const OGGZ_READ = (UInt32)(0)
const OGGZ_WRITE = (UInt32)(1)
const OGGZ_NONSTRICT = (UInt32)(16)
const OGGZ_AUTO = (UInt32)(32)
const OGGZ_PREFIX = (UInt32)(64)
const OGGZ_SUFFIX = (UInt32)(128)
# end enum OggzFlags

# begin enum OggzStopCtl
const OggzStopCtl = Cint
const OGGZ_CONTINUE = (Int32)(0)
const OGGZ_STOP_OK = (Int32)(1)
const OGGZ_STOP_ERR = (Int32)(-1)
# end enum OggzStopCtl

# begin enum OggzFlushOpts
const OggzFlushOpts = UInt32
const OGGZ_FLUSH_BEFORE = (UInt32)(1)
const OGGZ_FLUSH_AFTER = (UInt32)(2)
# end enum OggzFlushOpts

# begin enum OggzStreamContent
const OggzStreamContent = UInt32
const OGGZ_CONTENT_THEORA = (UInt32)(0)
const OGGZ_CONTENT_VORBIS = (UInt32)(1)
const OGGZ_CONTENT_SPEEX = (UInt32)(2)
const OGGZ_CONTENT_PCM = (UInt32)(3)
const OGGZ_CONTENT_CMML = (UInt32)(4)
const OGGZ_CONTENT_ANX2 = (UInt32)(5)
const OGGZ_CONTENT_SKELETON = (UInt32)(6)
const OGGZ_CONTENT_FLAC0 = (UInt32)(7)
const OGGZ_CONTENT_FLAC = (UInt32)(8)
const OGGZ_CONTENT_ANXDATA = (UInt32)(9)
const OGGZ_CONTENT_CELT = (UInt32)(10)
const OGGZ_CONTENT_KATE = (UInt32)(11)
const OGGZ_CONTENT_DIRAC = (UInt32)(12)
const OGGZ_CONTENT_UNKNOWN = (UInt32)(13)
# end enum OggzStreamContent

const OggzTable = Void
const OGGZ = Void
const oggz_off_t = Coff_t

mutable struct oggz_position
    calc_granulepos::ogg_int64_t
    begin_page_offset::oggz_off_t
    end_page_offset::oggz_off_t
    pages::Cint
    begin_segment_index::Cint
end

mutable struct oggz_packet
    op::ogg_packet
    pos::oggz_position
end

const OggzReadPacket = Ptr{Void}
const OggzReadPage = Ptr{Void}
const OggzMetric = Ptr{Void}
const OggzWriteHungry = Ptr{Void}
const OggzIOWrite = Ptr{Void}
const OggzIOSeek = Ptr{Void}
const OggzIOTell = Ptr{Void}
const OggzIOFlush = Ptr{Void}

mutable struct OggzComment
    name::Ptr{UInt8}
    value::Ptr{UInt8}
end

const FLAC__IOHandle = Ptr{Void}
const FLAC__IOCallback_Write = Ptr{Void}
const FLAC__IOCallback_Seek = Ptr{Void}
const FLAC__IOCallback_Tell = Ptr{Void}
const FLAC__IOCallback_Eof = Ptr{Void}
const FLAC__IOCallback_Close = Ptr{Void}

mutable struct FLAC__IOCallbacks
    read::Cint
    write::FLAC__IOCallback_Write
    seek::FLAC__IOCallback_Seek
    tell::FLAC__IOCallback_Tell
    eof::FLAC__IOCallback_Eof
    close::FLAC__IOCallback_Close
end

# begin enum ANONYMOUS_36
const ANONYMOUS_36 = UInt32
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE = (UInt32)(0)
const FLAC__ENTROPY_CODING_METHOD_PARTITIONED_RICE2 = (UInt32)(1)
# end enum ANONYMOUS_36

# begin enum ANONYMOUS_37
const ANONYMOUS_37 = UInt32
const FLAC__SUBFRAME_TYPE_CONSTANT = (UInt32)(0)
const FLAC__SUBFRAME_TYPE_VERBATIM = (UInt32)(1)
const FLAC__SUBFRAME_TYPE_FIXED = (UInt32)(2)
const FLAC__SUBFRAME_TYPE_LPC = (UInt32)(3)
# end enum ANONYMOUS_37

# begin enum ANONYMOUS_38
const ANONYMOUS_38 = UInt32
const FLAC__CHANNEL_ASSIGNMENT_INDEPENDENT = (UInt32)(0)
const FLAC__CHANNEL_ASSIGNMENT_LEFT_SIDE = (UInt32)(1)
const FLAC__CHANNEL_ASSIGNMENT_RIGHT_SIDE = (UInt32)(2)
const FLAC__CHANNEL_ASSIGNMENT_MID_SIDE = (UInt32)(3)
# end enum ANONYMOUS_38

# begin enum ANONYMOUS_39
const ANONYMOUS_39 = UInt32
const FLAC__FRAME_NUMBER_TYPE_FRAME_NUMBER = (UInt32)(0)
const FLAC__FRAME_NUMBER_TYPE_SAMPLE_NUMBER = (UInt32)(1)
# end enum ANONYMOUS_39

# begin enum ANONYMOUS_40
const ANONYMOUS_40 = UInt32
const FLAC__METADATA_TYPE_STREAMINFO = (UInt32)(0)
const FLAC__METADATA_TYPE_PADDING = (UInt32)(1)
const FLAC__METADATA_TYPE_APPLICATION = (UInt32)(2)
const FLAC__METADATA_TYPE_SEEKTABLE = (UInt32)(3)
const FLAC__METADATA_TYPE_VORBIS_COMMENT = (UInt32)(4)
const FLAC__METADATA_TYPE_CUESHEET = (UInt32)(5)
const FLAC__METADATA_TYPE_PICTURE = (UInt32)(6)
const FLAC__METADATA_TYPE_UNDEFINED = (UInt32)(7)
const FLAC__MAX_METADATA_TYPE = (UInt32)(126)
# end enum ANONYMOUS_40

# begin enum ANONYMOUS_41
const ANONYMOUS_41 = UInt32
const FLAC__STREAM_METADATA_PICTURE_TYPE_OTHER = (UInt32)(0)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON_STANDARD = (UInt32)(1)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FILE_ICON = (UInt32)(2)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FRONT_COVER = (UInt32)(3)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BACK_COVER = (UInt32)(4)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAFLET_PAGE = (UInt32)(5)
const FLAC__STREAM_METADATA_PICTURE_TYPE_MEDIA = (UInt32)(6)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LEAD_ARTIST = (UInt32)(7)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ARTIST = (UInt32)(8)
const FLAC__STREAM_METADATA_PICTURE_TYPE_CONDUCTOR = (UInt32)(9)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND = (UInt32)(10)
const FLAC__STREAM_METADATA_PICTURE_TYPE_COMPOSER = (UInt32)(11)
const FLAC__STREAM_METADATA_PICTURE_TYPE_LYRICIST = (UInt32)(12)
const FLAC__STREAM_METADATA_PICTURE_TYPE_RECORDING_LOCATION = (UInt32)(13)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_RECORDING = (UInt32)(14)
const FLAC__STREAM_METADATA_PICTURE_TYPE_DURING_PERFORMANCE = (UInt32)(15)
const FLAC__STREAM_METADATA_PICTURE_TYPE_VIDEO_SCREEN_CAPTURE = (UInt32)(16)
const FLAC__STREAM_METADATA_PICTURE_TYPE_FISH = (UInt32)(17)
const FLAC__STREAM_METADATA_PICTURE_TYPE_ILLUSTRATION = (UInt32)(18)
const FLAC__STREAM_METADATA_PICTURE_TYPE_BAND_LOGOTYPE = (UInt32)(19)
const FLAC__STREAM_METADATA_PICTURE_TYPE_PUBLISHER_LOGOTYPE = (UInt32)(20)
const FLAC__STREAM_METADATA_PICTURE_TYPE_UNDEFINED = (UInt32)(21)
# end enum ANONYMOUS_41

mutable struct FLAC__Metadata_SimpleIterator
end

# begin enum ANONYMOUS_42
const ANONYMOUS_42 = UInt32
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_OK = (UInt32)(0)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_ILLEGAL_INPUT = (UInt32)(1)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_ERROR_OPENING_FILE = (UInt32)(2)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_NOT_A_FLAC_FILE = (UInt32)(3)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_NOT_WRITABLE = (UInt32)(4)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_BAD_METADATA = (UInt32)(5)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_READ_ERROR = (UInt32)(6)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_SEEK_ERROR = (UInt32)(7)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_WRITE_ERROR = (UInt32)(8)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_RENAME_ERROR = (UInt32)(9)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_UNLINK_ERROR = (UInt32)(10)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(11)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_INTERNAL_ERROR = (UInt32)(12)
# end enum ANONYMOUS_42

# begin enum FLAC__Metadata_SimpleIteratorStatus
const FLAC__Metadata_SimpleIteratorStatus = UInt32
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_OK = (UInt32)(0)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_ILLEGAL_INPUT = (UInt32)(1)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_ERROR_OPENING_FILE = (UInt32)(2)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_NOT_A_FLAC_FILE = (UInt32)(3)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_NOT_WRITABLE = (UInt32)(4)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_BAD_METADATA = (UInt32)(5)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_READ_ERROR = (UInt32)(6)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_SEEK_ERROR = (UInt32)(7)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_WRITE_ERROR = (UInt32)(8)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_RENAME_ERROR = (UInt32)(9)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_UNLINK_ERROR = (UInt32)(10)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(11)
const FLAC__METADATA_SIMPLE_ITERATOR_STATUS_INTERNAL_ERROR = (UInt32)(12)
# end enum FLAC__Metadata_SimpleIteratorStatus

mutable struct FLAC__Metadata_Chain
end

mutable struct FLAC__Metadata_Iterator
end

# begin enum ANONYMOUS_43
const ANONYMOUS_43 = UInt32
const FLAC__METADATA_CHAIN_STATUS_OK = (UInt32)(0)
const FLAC__METADATA_CHAIN_STATUS_ILLEGAL_INPUT = (UInt32)(1)
const FLAC__METADATA_CHAIN_STATUS_ERROR_OPENING_FILE = (UInt32)(2)
const FLAC__METADATA_CHAIN_STATUS_NOT_A_FLAC_FILE = (UInt32)(3)
const FLAC__METADATA_CHAIN_STATUS_NOT_WRITABLE = (UInt32)(4)
const FLAC__METADATA_CHAIN_STATUS_BAD_METADATA = (UInt32)(5)
const FLAC__METADATA_CHAIN_STATUS_READ_ERROR = (UInt32)(6)
const FLAC__METADATA_CHAIN_STATUS_SEEK_ERROR = (UInt32)(7)
const FLAC__METADATA_CHAIN_STATUS_WRITE_ERROR = (UInt32)(8)
const FLAC__METADATA_CHAIN_STATUS_RENAME_ERROR = (UInt32)(9)
const FLAC__METADATA_CHAIN_STATUS_UNLINK_ERROR = (UInt32)(10)
const FLAC__METADATA_CHAIN_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(11)
const FLAC__METADATA_CHAIN_STATUS_INTERNAL_ERROR = (UInt32)(12)
const FLAC__METADATA_CHAIN_STATUS_INVALID_CALLBACKS = (UInt32)(13)
const FLAC__METADATA_CHAIN_STATUS_READ_WRITE_MISMATCH = (UInt32)(14)
const FLAC__METADATA_CHAIN_STATUS_WRONG_WRITE_CALL = (UInt32)(15)
# end enum ANONYMOUS_43

# begin enum FLAC__Metadata_ChainStatus
const FLAC__Metadata_ChainStatus = UInt32
const FLAC__METADATA_CHAIN_STATUS_OK = (UInt32)(0)
const FLAC__METADATA_CHAIN_STATUS_ILLEGAL_INPUT = (UInt32)(1)
const FLAC__METADATA_CHAIN_STATUS_ERROR_OPENING_FILE = (UInt32)(2)
const FLAC__METADATA_CHAIN_STATUS_NOT_A_FLAC_FILE = (UInt32)(3)
const FLAC__METADATA_CHAIN_STATUS_NOT_WRITABLE = (UInt32)(4)
const FLAC__METADATA_CHAIN_STATUS_BAD_METADATA = (UInt32)(5)
const FLAC__METADATA_CHAIN_STATUS_READ_ERROR = (UInt32)(6)
const FLAC__METADATA_CHAIN_STATUS_SEEK_ERROR = (UInt32)(7)
const FLAC__METADATA_CHAIN_STATUS_WRITE_ERROR = (UInt32)(8)
const FLAC__METADATA_CHAIN_STATUS_RENAME_ERROR = (UInt32)(9)
const FLAC__METADATA_CHAIN_STATUS_UNLINK_ERROR = (UInt32)(10)
const FLAC__METADATA_CHAIN_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(11)
const FLAC__METADATA_CHAIN_STATUS_INTERNAL_ERROR = (UInt32)(12)
const FLAC__METADATA_CHAIN_STATUS_INVALID_CALLBACKS = (UInt32)(13)
const FLAC__METADATA_CHAIN_STATUS_READ_WRITE_MISMATCH = (UInt32)(14)
const FLAC__METADATA_CHAIN_STATUS_WRONG_WRITE_CALL = (UInt32)(15)
# end enum FLAC__Metadata_ChainStatus

struct Array_27_UInt8
    d1::UInt8
    d2::UInt8
    d3::UInt8
    d4::UInt8
    d5::UInt8
    d6::UInt8
    d7::UInt8
    d8::UInt8
    d9::UInt8
    d10::UInt8
    d11::UInt8
    d12::UInt8
    d13::UInt8
    d14::UInt8
    d15::UInt8
    d16::UInt8
    d17::UInt8
    d18::UInt8
    d19::UInt8
    d20::UInt8
    d21::UInt8
    d22::UInt8
    d23::UInt8
    d24::UInt8
    d25::UInt8
    d26::UInt8
    d27::UInt8
end

zero(::Type{Array_27_UInt8}) = begin  # /home/bates/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_27_UInt8(fill(zero(UInt8),27)...)
    end

# begin enum ANONYMOUS_44
const ANONYMOUS_44 = UInt32
const FLAC__STREAM_DECODER_SEARCH_FOR_METADATA = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_METADATA = (UInt32)(1)
const FLAC__STREAM_DECODER_SEARCH_FOR_FRAME_SYNC = (UInt32)(2)
const FLAC__STREAM_DECODER_READ_FRAME = (UInt32)(3)
const FLAC__STREAM_DECODER_END_OF_STREAM = (UInt32)(4)
const FLAC__STREAM_DECODER_OGG_ERROR = (UInt32)(5)
const FLAC__STREAM_DECODER_SEEK_ERROR = (UInt32)(6)
const FLAC__STREAM_DECODER_ABORTED = (UInt32)(7)
const FLAC__STREAM_DECODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
const FLAC__STREAM_DECODER_UNINITIALIZED = (UInt32)(9)
# end enum ANONYMOUS_44

# begin enum ANONYMOUS_45
const ANONYMOUS_45 = UInt32
const FLAC__STREAM_DECODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(1)
const FLAC__STREAM_DECODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(2)
const FLAC__STREAM_DECODER_INIT_STATUS_MEMORY_ALLOCATION_ERROR = (UInt32)(3)
const FLAC__STREAM_DECODER_INIT_STATUS_ERROR_OPENING_FILE = (UInt32)(4)
const FLAC__STREAM_DECODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(5)
# end enum ANONYMOUS_45

# begin enum ANONYMOUS_46
const ANONYMOUS_46 = UInt32
const FLAC__STREAM_DECODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_DECODER_READ_STATUS_ABORT = (UInt32)(2)
# end enum ANONYMOUS_46

# begin enum ANONYMOUS_47
const ANONYMOUS_47 = UInt32
const FLAC__STREAM_DECODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_47

# begin enum ANONYMOUS_48
const ANONYMOUS_48 = UInt32
const FLAC__STREAM_DECODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_48

# begin enum ANONYMOUS_49
const ANONYMOUS_49 = UInt32
const FLAC__STREAM_DECODER_LENGTH_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_DECODER_LENGTH_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_DECODER_LENGTH_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_49

# begin enum ANONYMOUS_50
const ANONYMOUS_50 = UInt32
const FLAC__STREAM_DECODER_WRITE_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_DECODER_WRITE_STATUS_ABORT = (UInt32)(1)
# end enum ANONYMOUS_50

# begin enum ANONYMOUS_51
const ANONYMOUS_51 = UInt32
const FLAC__STREAM_DECODER_ERROR_STATUS_LOST_SYNC = (UInt32)(0)
const FLAC__STREAM_DECODER_ERROR_STATUS_BAD_HEADER = (UInt32)(1)
const FLAC__STREAM_DECODER_ERROR_STATUS_FRAME_CRC_MISMATCH = (UInt32)(2)
const FLAC__STREAM_DECODER_ERROR_STATUS_UNPARSEABLE_STREAM = (UInt32)(3)
# end enum ANONYMOUS_51

# begin enum ANONYMOUS_52
const ANONYMOUS_52 = UInt32
const FLAC__STREAM_ENCODER_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_UNINITIALIZED = (UInt32)(1)
const FLAC__STREAM_ENCODER_OGG_ERROR = (UInt32)(2)
const FLAC__STREAM_ENCODER_VERIFY_DECODER_ERROR = (UInt32)(3)
const FLAC__STREAM_ENCODER_VERIFY_MISMATCH_IN_AUDIO_DATA = (UInt32)(4)
const FLAC__STREAM_ENCODER_CLIENT_ERROR = (UInt32)(5)
const FLAC__STREAM_ENCODER_IO_ERROR = (UInt32)(6)
const FLAC__STREAM_ENCODER_FRAMING_ERROR = (UInt32)(7)
const FLAC__STREAM_ENCODER_MEMORY_ALLOCATION_ERROR = (UInt32)(8)
# end enum ANONYMOUS_52

# begin enum ANONYMOUS_53
const ANONYMOUS_53 = UInt32
const FLAC__STREAM_ENCODER_INIT_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_INIT_STATUS_ENCODER_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_INIT_STATUS_UNSUPPORTED_CONTAINER = (UInt32)(2)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_CALLBACKS = (UInt32)(3)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_NUMBER_OF_CHANNELS = (UInt32)(4)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BITS_PER_SAMPLE = (UInt32)(5)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_SAMPLE_RATE = (UInt32)(6)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_BLOCK_SIZE = (UInt32)(7)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_MAX_LPC_ORDER = (UInt32)(8)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_QLP_COEFF_PRECISION = (UInt32)(9)
const FLAC__STREAM_ENCODER_INIT_STATUS_BLOCK_SIZE_TOO_SMALL_FOR_LPC_ORDER = (UInt32)(10)
const FLAC__STREAM_ENCODER_INIT_STATUS_NOT_STREAMABLE = (UInt32)(11)
const FLAC__STREAM_ENCODER_INIT_STATUS_INVALID_METADATA = (UInt32)(12)
const FLAC__STREAM_ENCODER_INIT_STATUS_ALREADY_INITIALIZED = (UInt32)(13)
# end enum ANONYMOUS_53

# begin enum ANONYMOUS_54
const ANONYMOUS_54 = UInt32
const FLAC__STREAM_ENCODER_READ_STATUS_CONTINUE = (UInt32)(0)
const FLAC__STREAM_ENCODER_READ_STATUS_END_OF_STREAM = (UInt32)(1)
const FLAC__STREAM_ENCODER_READ_STATUS_ABORT = (UInt32)(2)
const FLAC__STREAM_ENCODER_READ_STATUS_UNSUPPORTED = (UInt32)(3)
# end enum ANONYMOUS_54

# begin enum ANONYMOUS_55
const ANONYMOUS_55 = UInt32
const FLAC__STREAM_ENCODER_WRITE_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_WRITE_STATUS_FATAL_ERROR = (UInt32)(1)
# end enum ANONYMOUS_55

# begin enum ANONYMOUS_56
const ANONYMOUS_56 = UInt32
const FLAC__STREAM_ENCODER_SEEK_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_SEEK_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_SEEK_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_56

# begin enum ANONYMOUS_57
const ANONYMOUS_57 = UInt32
const FLAC__STREAM_ENCODER_TELL_STATUS_OK = (UInt32)(0)
const FLAC__STREAM_ENCODER_TELL_STATUS_ERROR = (UInt32)(1)
const FLAC__STREAM_ENCODER_TELL_STATUS_UNSUPPORTED = (UInt32)(2)
# end enum ANONYMOUS_57
