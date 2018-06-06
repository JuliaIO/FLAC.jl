@enum(ChannelAssignment,
      Independent,
      LeftSide,
      RightSide,
      MidSide)

@enum(FrameNumberType,
      FrameNumber,
      SampleNumber)

struct FrameHeader
    blocksize::Cuint
    sample_rate::Cuint
    channels::Cuint
    channel_assignment::ChannelAssignment
    bits_per_sample::Cuint
    typ::FrameNumberType
    num::UInt32
    crc::UInt8
end

const FrameHeaderSync = 0x00003ffe

const MAX_CHANNELS = 0x00000008

struct FrameFooter
    crc::UInt16
end

@enum(EntropyCodingMethodType,
      PartitionedRice,
      PartitionedRice2)

struct PartitionedRiceContents
    parameters::Ptr{Cuint}
    raw_bits::Ptr{Cuint}
    capacity_by_order::Cuint
end

struct PartitionedRiceT
    order::Cuint
    contents::Ptr{PartitionedRiceContents}
end

struct EntropyCodingMethod
    typ::EntropyCodingMethodType
    data::PartitionedRiceT
end

@enum(SubframeType,
      SubframeConstant,
      SubframeVerbatim,
      SubframeFixed,
      SubframeLPC)

abstract type Subframe end

struct Subframe_Constant <: Subframe
    value::Int32
end

struct Subframe_Verbatim <: Subframe
    data::Ptr{Int32}
end

const MAX_FIXED_ORDER = 0x00000004

struct SubFrame_Fixed <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    warmup::NTuple{Int(MAX_FIXED_ORDER),Int32}
    residual::Ptr{Int32}
end

const MAX_LPC_ORDER = 0x00000020

struct SubFrame_LPC <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    qlp_coeff_precision::Cuint
    quantization_level::Cint
    qlp_coeff::NTuple{Int(MAX_LPC_ORDER),Int32}
    warmup::NTuple{Int(MAX_LPC_ORDER),Int32}
    residual::Ptr{Int32}
end

struct SubFrame{SF <: Subframe}
    typ::SubframeType
    data::SF
    wasted_bits::Cuint
end

struct Frame
    header::FrameHeader
    subframes::NTuple{Int(MAX_CHANNELS),SubFrame}
    footer::FrameFooter
end
