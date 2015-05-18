@enum ChannelAssignment Independent=0 Left_Side=1 Right_Side=2 Mid_Side=3

@enum FrameNumberType Frame=0 Sample=1

abstract FrameHeader
immutable FrameFrameHeader <: FrameHeader
    blocksize::Cuint
    sample_rate::Cuint
    channels::Cuint
    channel_assignment::ChannelAssignment
    bits_per_sample::Cuint
    typ::FrameNumberType
    num::UInt32
    crc::UInt8
end

immutable SampleFrameHeader <: FrameHeader
    blocksize::Cuint
    sample_rate::Cuint
    channels::Cuint
    channel_assignment::ChannelAssignment
    bits_per_sample::Cuint
    typ::FrameNumberType
    num::UInt64
    crc::UInt8
end

const FrameHeaderSync = 0x00003ffe

const MAX_CHANNELS = 0x00000008

immutable FrameFooter
    crc::UInt16
end

@enum EntropyCodingMethodType Rice=0 Rice2=1

immutable PartitionedRiceContents
    parameters::Ptr{Cuint}
    raw_bits::Ptr{Cuint}
    capacity_by_order::Cuint
end

immutable PartitionedRice
    order::Cuint
    contents::Ptr{PartitionedRiceContents}
end

immutable EntropyCodingMethod
    typ::EntropyCodingMethodType
    data::PartitionedRice
end

@enum SubframeType Constant=0 Verbatim=1 Fixed=2 LPC=3

abstract Subframe

immutable Subframe_Constant <: Subframe
    value::Int32
end

immutable Subframe_Verbatim <: Subframe
    data::Ptr{Int32}
end

const MAX_FIXED_ORDER = 0x00000004

immutable SubFrame_Fixed <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    warmup::NTuple{MAX_FIXED_ORDER,Int32}
    residual::Ptr{Int32}
end

const MAX_LPC_ORDER = 0x00000020

immutable SubFrame_LPC <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    qlp_coeff_precision::Cuint
    quantization_level::Cint
    qlp_coeff::NTuple{MAX_LPC_ORDER,Int32}
    warmup::NTuple{MAX_LPC_ORDER,Int32}
    residual::Ptr{Int32}
end

immutable SubFrame{SF <: Subframe}
    typ::SubframeType
    data::SF
    wasted_bits::Cuint
end

immutable Frame
    header::FrameHeader
    subframes::NTuple{MAX_CHANNELS,SubFrame}
    footer::FrameFooter
end
