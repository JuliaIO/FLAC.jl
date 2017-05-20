@enum(ChannelAssignment,
      Independent,
      LeftSide,
      RightSide,
      MidSide)

@enum(FrameNumberType,
      FrameNumber,
      SampleNumber)

@compat immutable FrameHeader
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

@compat immutable FrameFooter
    crc::UInt16
end

@enum(EntropyCodingMethodType,
      PartitionedRice,
      PartitionedRice2)

@compat immutable PartitionedRiceContents
    parameters::Ptr{Cuint}
    raw_bits::Ptr{Cuint}
    capacity_by_order::Cuint
end

@compat immutable PartitionedRiceT
    order::Cuint
    contents::Ptr{PartitionedRiceContents}
end

@compat immutable EntropyCodingMethod
    typ::EntropyCodingMethodType
    data::PartitionedRiceT
end

@enum(SubframeType,
      SubframeConstant,
      SubframeVerbatim,
      SubframeFixed,
      SubframeLPC)

@compat abstract type Subframe end

@compat immutable Subframe_Constant <: Subframe
    value::Int32
end

@compat immutable Subframe_Verbatim <: Subframe
    data::Ptr{Int32}
end

const MAX_FIXED_ORDER = 0x00000004

@compat immutable SubFrame_Fixed <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    warmup::NTuple{Int(MAX_FIXED_ORDER),Int32}
    residual::Ptr{Int32}
end

const MAX_LPC_ORDER = 0x00000020

@compat immutable SubFrame_LPC <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    qlp_coeff_precision::Cuint
    quantization_level::Cint
    qlp_coeff::NTuple{Int(MAX_LPC_ORDER),Int32}
    warmup::NTuple{Int(MAX_LPC_ORDER),Int32}
    residual::Ptr{Int32}
end

@compat immutable SubFrame{SF <: Subframe}
    typ::SubframeType
    data::SF
    wasted_bits::Cuint
end

@compat immutable Frame
    header::FrameHeader
    subframes::NTuple{Int(MAX_CHANNELS),SubFrame}
    footer::FrameFooter
end
