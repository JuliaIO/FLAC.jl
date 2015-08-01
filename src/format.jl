@enum(ChannelAssignment, Independent, Left_Side, Right_Side, Mid_Side)

@enum(FrameNumberType, FrameNo, SampleNo)

immutable FrameHeader
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

immutable FrameFooter
    crc::UInt16
end

@enum(EntropyCodingMethodType, Rice, Rice2)

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

@enum(SubframeType, SFConstant, SFVerbatim, SFFixed, SFLPC)

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
    warmup::NTuple{Int(MAX_FIXED_ORDER),Int32}
    residual::Ptr{Int32}
end

const MAX_LPC_ORDER = 0x00000020

immutable SubFrame_LPC <: Subframe
    method::EntropyCodingMethod
    order::Cuint
    qlp_coeff_precision::Cuint
    quantization_level::Cint
    qlp_coeff::NTuple{Int(MAX_LPC_ORDER),Int32}
    warmup::NTuple{Int(MAX_LPC_ORDER),Int32}
    residual::Ptr{Int32}
end

immutable SubFrame{SF <: Subframe}
    typ::SubframeType
    data::SF
    wasted_bits::Cuint
end

immutable Frame
    header::FrameHeader
    subframes::NTuple{Int(MAX_CHANNELS),SubFrame}
    footer::FrameFooter
end
