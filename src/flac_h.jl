# Julia wrapper for header: /usr/include/FLAC/stream_encoder.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

include(joinpath(dirname(@__FILE__),"common_h.jl"))
const libFLAC = "/usr/lib/x86_64-linux-gnu/libFLAC.so";
const libogg = "/usr/lib/x86_64-linux-gnu/libogg.so";
const liboggz = "/usr/lib/x86_64-linux-gnu/liboggz.so";
const FILE = Void;

function FLAC__format_sample_rate_is_valid(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_valid,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_blocksize_is_subset(blocksize::UInt32,sample_rate::UInt32)
    ccall((:FLAC__format_blocksize_is_subset,libFLAC),FLAC__bool,(UInt32,UInt32),blocksize,sample_rate)
end

function FLAC__format_sample_rate_is_subset(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_subset,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_vorbiscomment_entry_name_is_legal(name::Ptr{UInt8})
    ccall((:FLAC__format_vorbiscomment_entry_name_is_legal,libFLAC),FLAC__bool,(Ptr{UInt8},),name)
end

function FLAC__format_vorbiscomment_entry_value_is_legal(value::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_value_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),value,length)
end

function FLAC__format_vorbiscomment_entry_is_legal(entry::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),entry,length)
end

function FLAC__format_seektable_is_legal(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_seektable_sort(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_sort,libFLAC),UInt32,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_cuesheet_is_legal(cue_sheet::Ptr{FLAC__StreamMetadata_CueSheet},check_cd_da_subset::FLAC__bool,violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_cuesheet_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_CueSheet},FLAC__bool,Ptr{Ptr{UInt8}}),cue_sheet,check_cd_da_subset,violation)
end

function FLAC__format_picture_is_legal(picture::Ptr{FLAC__StreamMetadata_Picture},violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_picture_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_Picture},Ptr{Ptr{UInt8}}),picture,violation)
end

function FLAC__stream_decoder_new()
    ccall((:FLAC__stream_decoder_new,libFLAC),Ptr{FLAC__StreamDecoder},())
end

function FLAC__stream_decoder_delete(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_delete,libFLAC),Void,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_ogg_serial_number(decoder::Ptr{FLAC__StreamDecoder},serial_number::Clong)
    ccall((:FLAC__stream_decoder_set_ogg_serial_number,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Clong),decoder,serial_number)
end

function FLAC__stream_decoder_set_md5_checking(decoder::Ptr{FLAC__StreamDecoder},value::FLAC__bool)
    ccall((:FLAC__stream_decoder_set_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__bool),decoder,value)
end

function FLAC__stream_decoder_set_metadata_respond(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_respond,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_respond_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_respond_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_respond_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_metadata_ignore(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_ignore,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_ignore_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_ignore_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_ignore_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_ignore_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_state(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_state,libFLAC),FLAC__StreamDecoderState,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_resolved_state_string(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_resolved_state_string,libFLAC),Ptr{UInt8},(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_md5_checking(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_total_samples(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_total_samples,libFLAC),FLAC__uint64,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channels(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channels,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channel_assignment(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channel_assignment,libFLAC),FLAC__ChannelAssignment,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_bits_per_sample(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_bits_per_sample,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_sample_rate(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_sample_rate,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_blocksize(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_blocksize,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_decode_position(decoder::Ptr{FLAC__StreamDecoder},position::Ptr{FLAC__uint64})
    ccall((:FLAC__stream_decoder_get_decode_position,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Ptr{FLAC__uint64}),decoder,position)
end

function FLAC__stream_decoder_init_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_finish(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_finish,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_flush(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_flush,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_reset(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_reset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_single(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_single,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_metadata(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_stream(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_stream,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_skip_single_frame(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_skip_single_frame,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_seek_absolute(decoder::Ptr{FLAC__StreamDecoder},sample::FLAC__uint64)
    ccall((:FLAC__stream_decoder_seek_absolute,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__uint64),decoder,sample)
end

function FLAC__stream_encoder_new()
    ccall((:FLAC__stream_encoder_new,libFLAC),Ptr{FLAC__StreamEncoder},())
end

function FLAC__stream_encoder_delete(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_delete,libFLAC),Void,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_set_ogg_serial_number(encoder::Ptr{FLAC__StreamEncoder},serial_number::Clong)
    ccall((:FLAC__stream_encoder_set_ogg_serial_number,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Clong),encoder,serial_number)
end

function FLAC__stream_encoder_set_verify(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_verify,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_streamable_subset(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_streamable_subset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_channels(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_channels,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_bits_per_sample(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_bits_per_sample,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_sample_rate(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_sample_rate,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_compression_level(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_compression_level,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_blocksize(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_blocksize,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_do_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_loose_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_loose_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_apodization(encoder::Ptr{FLAC__StreamEncoder},specification::Ptr{UInt8})
    ccall((:FLAC__stream_encoder_set_apodization,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{UInt8}),encoder,specification)
end

function FLAC__stream_encoder_set_max_lpc_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_max_lpc_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_qlp_coeff_precision(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_qlp_coeff_precision,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_do_qlp_coeff_prec_search(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_qlp_coeff_prec_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_do_escape_coding(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_escape_coding,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_do_exhaustive_model_search(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_exhaustive_model_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_min_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_min_residual_partition_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_max_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_max_residual_partition_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_rice_parameter_search_dist(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_rice_parameter_search_dist,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_total_samples_estimate(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__uint64)
    ccall((:FLAC__stream_encoder_set_total_samples_estimate,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__uint64),encoder,value)
end

function FLAC__stream_encoder_set_metadata(encoder::Ptr{FLAC__StreamEncoder},metadata::Ptr{Ptr{FLAC__StreamMetadata}},num_blocks::UInt32)
    ccall((:FLAC__stream_encoder_set_metadata,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{Ptr{FLAC__StreamMetadata}},UInt32),encoder,metadata,num_blocks)
end

function FLAC__stream_encoder_get_state(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_state,libFLAC),FLAC__StreamEncoderState,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_verify_decoder_state(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_verify_decoder_state,libFLAC),FLAC__StreamDecoderState,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_resolved_state_string(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_resolved_state_string,libFLAC),Ptr{UInt8},(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_verify_decoder_error_stats(encoder::Ptr{FLAC__StreamEncoder},absolute_sample::Ptr{FLAC__uint64},frame_number::Ptr{UInt32},channel::Ptr{UInt32},sample::Ptr{UInt32},expected::Ptr{FLAC__int32},got::Ptr{FLAC__int32})
    ccall((:FLAC__stream_encoder_get_verify_decoder_error_stats,libFLAC),Void,(Ptr{FLAC__StreamEncoder},Ptr{FLAC__uint64},Ptr{UInt32},Ptr{UInt32},Ptr{UInt32},Ptr{FLAC__int32},Ptr{FLAC__int32}),encoder,absolute_sample,frame_number,channel,sample,expected,got)
end

function FLAC__stream_encoder_get_verify(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_verify,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_streamable_subset(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_streamable_subset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_channels(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_channels,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_bits_per_sample(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_bits_per_sample,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_sample_rate(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_sample_rate,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_blocksize(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_blocksize,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_loose_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_loose_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_max_lpc_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_max_lpc_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_qlp_coeff_precision(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_qlp_coeff_precision,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_qlp_coeff_prec_search(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_qlp_coeff_prec_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_escape_coding(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_escape_coding,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_exhaustive_model_search(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_exhaustive_model_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_min_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_min_residual_partition_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_max_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_max_residual_partition_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_rice_parameter_search_dist(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_rice_parameter_search_dist,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_total_samples_estimate(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_total_samples_estimate,libFLAC),FLAC__uint64,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_init_stream(encoder::Ptr{FLAC__StreamEncoder},write_callback::FLAC__StreamEncoderWriteCallback,seek_callback::FLAC__StreamEncoderSeekCallback,tell_callback::FLAC__StreamEncoderTellCallback,metadata_callback::FLAC__StreamEncoderMetadataCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_stream,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},FLAC__StreamEncoderWriteCallback,FLAC__StreamEncoderSeekCallback,FLAC__StreamEncoderTellCallback,FLAC__StreamEncoderMetadataCallback,Ptr{Void}),encoder,write_callback,seek_callback,tell_callback,metadata_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_stream(encoder::Ptr{FLAC__StreamEncoder},read_callback::FLAC__StreamEncoderReadCallback,write_callback::FLAC__StreamEncoderWriteCallback,seek_callback::FLAC__StreamEncoderSeekCallback,tell_callback::FLAC__StreamEncoderTellCallback,metadata_callback::FLAC__StreamEncoderMetadataCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_stream,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},FLAC__StreamEncoderReadCallback,FLAC__StreamEncoderWriteCallback,FLAC__StreamEncoderSeekCallback,FLAC__StreamEncoderTellCallback,FLAC__StreamEncoderMetadataCallback,Ptr{Void}),encoder,read_callback,write_callback,seek_callback,tell_callback,metadata_callback,client_data)
end

function FLAC__stream_encoder_init_FILE(encoder::Ptr{FLAC__StreamEncoder},file::Ptr{FILE},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_FILE,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{FILE},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,file,progress_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_FILE(encoder::Ptr{FLAC__StreamEncoder},file::Ptr{FILE},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_FILE,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{FILE},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,file,progress_callback,client_data)
end

function FLAC__stream_encoder_init_file(encoder::Ptr{FLAC__StreamEncoder},filename::Ptr{UInt8},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_file,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{UInt8},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,filename,progress_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_file(encoder::Ptr{FLAC__StreamEncoder},filename::Ptr{UInt8},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_file,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{UInt8},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,filename,progress_callback,client_data)
end

function FLAC__stream_encoder_finish(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_finish,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_process(encoder::Ptr{FLAC__StreamEncoder},buffer::Ptr{Ptr{FLAC__int32}},samples::UInt32)
    ccall((:FLAC__stream_encoder_process,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{Ptr{FLAC__int32}},UInt32),encoder,buffer,samples)
end

function FLAC__stream_encoder_process_interleaved(encoder::Ptr{FLAC__StreamEncoder},buffer::Ptr{FLAC__int32},samples::UInt32)
    ccall((:FLAC__stream_encoder_process_interleaved,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{FLAC__int32},UInt32),encoder,buffer,samples)
end

function FLAC__format_sample_rate_is_valid(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_valid,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_blocksize_is_subset(blocksize::UInt32,sample_rate::UInt32)
    ccall((:FLAC__format_blocksize_is_subset,libFLAC),FLAC__bool,(UInt32,UInt32),blocksize,sample_rate)
end

function FLAC__format_sample_rate_is_subset(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_subset,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_vorbiscomment_entry_name_is_legal(name::Ptr{UInt8})
    ccall((:FLAC__format_vorbiscomment_entry_name_is_legal,libFLAC),FLAC__bool,(Ptr{UInt8},),name)
end

function FLAC__format_vorbiscomment_entry_value_is_legal(value::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_value_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),value,length)
end

function FLAC__format_vorbiscomment_entry_is_legal(entry::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),entry,length)
end

function FLAC__format_seektable_is_legal(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_seektable_sort(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_sort,libFLAC),UInt32,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_cuesheet_is_legal(cue_sheet::Ptr{FLAC__StreamMetadata_CueSheet},check_cd_da_subset::FLAC__bool,violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_cuesheet_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_CueSheet},FLAC__bool,Ptr{Ptr{UInt8}}),cue_sheet,check_cd_da_subset,violation)
end

function FLAC__format_picture_is_legal(picture::Ptr{FLAC__StreamMetadata_Picture},violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_picture_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_Picture},Ptr{Ptr{UInt8}}),picture,violation)
end

function FLAC__stream_decoder_new()
    ccall((:FLAC__stream_decoder_new,libFLAC),Ptr{FLAC__StreamDecoder},())
end

function FLAC__stream_decoder_delete(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_delete,libFLAC),Void,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_ogg_serial_number(decoder::Ptr{FLAC__StreamDecoder},serial_number::Clong)
    ccall((:FLAC__stream_decoder_set_ogg_serial_number,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Clong),decoder,serial_number)
end

function FLAC__stream_decoder_set_md5_checking(decoder::Ptr{FLAC__StreamDecoder},value::FLAC__bool)
    ccall((:FLAC__stream_decoder_set_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__bool),decoder,value)
end

function FLAC__stream_decoder_set_metadata_respond(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_respond,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_respond_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_respond_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_respond_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_metadata_ignore(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_ignore,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_ignore_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_ignore_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_ignore_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_ignore_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_state(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_state,libFLAC),FLAC__StreamDecoderState,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_resolved_state_string(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_resolved_state_string,libFLAC),Ptr{UInt8},(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_md5_checking(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_total_samples(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_total_samples,libFLAC),FLAC__uint64,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channels(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channels,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channel_assignment(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channel_assignment,libFLAC),FLAC__ChannelAssignment,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_bits_per_sample(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_bits_per_sample,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_sample_rate(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_sample_rate,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_blocksize(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_blocksize,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_decode_position(decoder::Ptr{FLAC__StreamDecoder},position::Ptr{FLAC__uint64})
    ccall((:FLAC__stream_decoder_get_decode_position,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Ptr{FLAC__uint64}),decoder,position)
end

function FLAC__stream_decoder_init_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_finish(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_finish,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_flush(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_flush,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_reset(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_reset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_single(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_single,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_metadata(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_stream(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_stream,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_skip_single_frame(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_skip_single_frame,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_seek_absolute(decoder::Ptr{FLAC__StreamDecoder},sample::FLAC__uint64)
    ccall((:FLAC__stream_decoder_seek_absolute,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__uint64),decoder,sample)
end

function oggpack_writeinit(b::Ptr{oggpack_buffer})
    ccall((:oggpack_writeinit,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpack_writecheck(b::Ptr{oggpack_buffer})
    ccall((:oggpack_writecheck,libogg),Cint,(Ptr{oggpack_buffer},),b)
end

function oggpack_writetrunc(b::Ptr{oggpack_buffer},bits::Clong)
    ccall((:oggpack_writetrunc,libogg),Void,(Ptr{oggpack_buffer},Clong),b,bits)
end

function oggpack_writealign(b::Ptr{oggpack_buffer})
    ccall((:oggpack_writealign,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpack_writecopy(b::Ptr{oggpack_buffer},source::Ptr{Void},bits::Clong)
    ccall((:oggpack_writecopy,libogg),Void,(Ptr{oggpack_buffer},Ptr{Void},Clong),b,source,bits)
end

function oggpack_reset(b::Ptr{oggpack_buffer})
    ccall((:oggpack_reset,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpack_writeclear(b::Ptr{oggpack_buffer})
    ccall((:oggpack_writeclear,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpack_readinit(b::Ptr{oggpack_buffer},buf::Ptr{Cuchar},bytes::Cint)
    ccall((:oggpack_readinit,libogg),Void,(Ptr{oggpack_buffer},Ptr{Cuchar},Cint),b,buf,bytes)
end

function oggpack_write(b::Ptr{oggpack_buffer},value::Culong,bits::Cint)
    ccall((:oggpack_write,libogg),Void,(Ptr{oggpack_buffer},Culong,Cint),b,value,bits)
end

function oggpack_look(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpack_look,libogg),Clong,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpack_look1(b::Ptr{oggpack_buffer})
    ccall((:oggpack_look1,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpack_adv(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpack_adv,libogg),Void,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpack_adv1(b::Ptr{oggpack_buffer})
    ccall((:oggpack_adv1,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpack_read(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpack_read,libogg),Clong,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpack_read1(b::Ptr{oggpack_buffer})
    ccall((:oggpack_read1,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpack_bytes(b::Ptr{oggpack_buffer})
    ccall((:oggpack_bytes,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpack_bits(b::Ptr{oggpack_buffer})
    ccall((:oggpack_bits,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpack_get_buffer(b::Ptr{oggpack_buffer})
    ccall((:oggpack_get_buffer,libogg),Ptr{Cuchar},(Ptr{oggpack_buffer},),b)
end

function oggpackB_writeinit(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_writeinit,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpackB_writecheck(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_writecheck,libogg),Cint,(Ptr{oggpack_buffer},),b)
end

function oggpackB_writetrunc(b::Ptr{oggpack_buffer},bits::Clong)
    ccall((:oggpackB_writetrunc,libogg),Void,(Ptr{oggpack_buffer},Clong),b,bits)
end

function oggpackB_writealign(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_writealign,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpackB_writecopy(b::Ptr{oggpack_buffer},source::Ptr{Void},bits::Clong)
    ccall((:oggpackB_writecopy,libogg),Void,(Ptr{oggpack_buffer},Ptr{Void},Clong),b,source,bits)
end

function oggpackB_reset(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_reset,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpackB_writeclear(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_writeclear,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpackB_readinit(b::Ptr{oggpack_buffer},buf::Ptr{Cuchar},bytes::Cint)
    ccall((:oggpackB_readinit,libogg),Void,(Ptr{oggpack_buffer},Ptr{Cuchar},Cint),b,buf,bytes)
end

function oggpackB_write(b::Ptr{oggpack_buffer},value::Culong,bits::Cint)
    ccall((:oggpackB_write,libogg),Void,(Ptr{oggpack_buffer},Culong,Cint),b,value,bits)
end

function oggpackB_look(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpackB_look,libogg),Clong,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpackB_look1(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_look1,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpackB_adv(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpackB_adv,libogg),Void,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpackB_adv1(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_adv1,libogg),Void,(Ptr{oggpack_buffer},),b)
end

function oggpackB_read(b::Ptr{oggpack_buffer},bits::Cint)
    ccall((:oggpackB_read,libogg),Clong,(Ptr{oggpack_buffer},Cint),b,bits)
end

function oggpackB_read1(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_read1,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpackB_bytes(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_bytes,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpackB_bits(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_bits,libogg),Clong,(Ptr{oggpack_buffer},),b)
end

function oggpackB_get_buffer(b::Ptr{oggpack_buffer})
    ccall((:oggpackB_get_buffer,libogg),Ptr{Cuchar},(Ptr{oggpack_buffer},),b)
end

function ogg_stream_packetin(os::Ptr{ogg_stream_state},op::Ptr{ogg_packet})
    ccall((:ogg_stream_packetin,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_packet}),os,op)
end

function ogg_stream_iovecin(os::Ptr{ogg_stream_state},iov::Ptr{ogg_iovec_t},count::Cint,e_o_s::Clong,granulepos::ogg_int64_t)
    ccall((:ogg_stream_iovecin,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_iovec_t},Cint,Clong,ogg_int64_t),os,iov,count,e_o_s,granulepos)
end

function ogg_stream_pageout(os::Ptr{ogg_stream_state},og::Ptr{ogg_page})
    ccall((:ogg_stream_pageout,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_page}),os,og)
end

function ogg_stream_pageout_fill(os::Ptr{ogg_stream_state},og::Ptr{ogg_page},nfill::Cint)
    ccall((:ogg_stream_pageout_fill,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_page},Cint),os,og,nfill)
end

function ogg_stream_flush(os::Ptr{ogg_stream_state},og::Ptr{ogg_page})
    ccall((:ogg_stream_flush,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_page}),os,og)
end

function ogg_stream_flush_fill(os::Ptr{ogg_stream_state},og::Ptr{ogg_page},nfill::Cint)
    ccall((:ogg_stream_flush_fill,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_page},Cint),os,og,nfill)
end

function ogg_sync_init(oy::Ptr{ogg_sync_state})
    ccall((:ogg_sync_init,libogg),Cint,(Ptr{ogg_sync_state},),oy)
end

function ogg_sync_clear(oy::Ptr{ogg_sync_state})
    ccall((:ogg_sync_clear,libogg),Cint,(Ptr{ogg_sync_state},),oy)
end

function ogg_sync_reset(oy::Ptr{ogg_sync_state})
    ccall((:ogg_sync_reset,libogg),Cint,(Ptr{ogg_sync_state},),oy)
end

function ogg_sync_destroy(oy::Ptr{ogg_sync_state})
    ccall((:ogg_sync_destroy,libogg),Cint,(Ptr{ogg_sync_state},),oy)
end

function ogg_sync_check(oy::Ptr{ogg_sync_state})
    ccall((:ogg_sync_check,libogg),Cint,(Ptr{ogg_sync_state},),oy)
end

function ogg_sync_buffer(oy::Ptr{ogg_sync_state},size::Clong)
    ccall((:ogg_sync_buffer,libogg),Ptr{UInt8},(Ptr{ogg_sync_state},Clong),oy,size)
end

function ogg_sync_wrote(oy::Ptr{ogg_sync_state},bytes::Clong)
    ccall((:ogg_sync_wrote,libogg),Cint,(Ptr{ogg_sync_state},Clong),oy,bytes)
end

function ogg_sync_pageseek(oy::Ptr{ogg_sync_state},og::Ptr{ogg_page})
    ccall((:ogg_sync_pageseek,libogg),Clong,(Ptr{ogg_sync_state},Ptr{ogg_page}),oy,og)
end

function ogg_sync_pageout(oy::Ptr{ogg_sync_state},og::Ptr{ogg_page})
    ccall((:ogg_sync_pageout,libogg),Cint,(Ptr{ogg_sync_state},Ptr{ogg_page}),oy,og)
end

function ogg_stream_pagein(os::Ptr{ogg_stream_state},og::Ptr{ogg_page})
    ccall((:ogg_stream_pagein,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_page}),os,og)
end

function ogg_stream_packetout(os::Ptr{ogg_stream_state},op::Ptr{ogg_packet})
    ccall((:ogg_stream_packetout,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_packet}),os,op)
end

function ogg_stream_packetpeek(os::Ptr{ogg_stream_state},op::Ptr{ogg_packet})
    ccall((:ogg_stream_packetpeek,libogg),Cint,(Ptr{ogg_stream_state},Ptr{ogg_packet}),os,op)
end

function ogg_stream_init(os::Ptr{ogg_stream_state},serialno::Cint)
    ccall((:ogg_stream_init,libogg),Cint,(Ptr{ogg_stream_state},Cint),os,serialno)
end

function ogg_stream_clear(os::Ptr{ogg_stream_state})
    ccall((:ogg_stream_clear,libogg),Cint,(Ptr{ogg_stream_state},),os)
end

function ogg_stream_reset(os::Ptr{ogg_stream_state})
    ccall((:ogg_stream_reset,libogg),Cint,(Ptr{ogg_stream_state},),os)
end

function ogg_stream_reset_serialno(os::Ptr{ogg_stream_state},serialno::Cint)
    ccall((:ogg_stream_reset_serialno,libogg),Cint,(Ptr{ogg_stream_state},Cint),os,serialno)
end

function ogg_stream_destroy(os::Ptr{ogg_stream_state})
    ccall((:ogg_stream_destroy,libogg),Cint,(Ptr{ogg_stream_state},),os)
end

function ogg_stream_check(os::Ptr{ogg_stream_state})
    ccall((:ogg_stream_check,libogg),Cint,(Ptr{ogg_stream_state},),os)
end

function ogg_stream_eos(os::Ptr{ogg_stream_state})
    ccall((:ogg_stream_eos,libogg),Cint,(Ptr{ogg_stream_state},),os)
end

function ogg_page_checksum_set(og::Ptr{ogg_page})
    ccall((:ogg_page_checksum_set,libogg),Void,(Ptr{ogg_page},),og)
end

function ogg_page_version(og::Ptr{ogg_page})
    ccall((:ogg_page_version,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_page_continued(og::Ptr{ogg_page})
    ccall((:ogg_page_continued,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_page_bos(og::Ptr{ogg_page})
    ccall((:ogg_page_bos,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_page_eos(og::Ptr{ogg_page})
    ccall((:ogg_page_eos,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_page_granulepos(og::Ptr{ogg_page})
    ccall((:ogg_page_granulepos,libogg),ogg_int64_t,(Ptr{ogg_page},),og)
end

function ogg_page_serialno(og::Ptr{ogg_page})
    ccall((:ogg_page_serialno,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_page_pageno(og::Ptr{ogg_page})
    ccall((:ogg_page_pageno,libogg),Clong,(Ptr{ogg_page},),og)
end

function ogg_page_packets(og::Ptr{ogg_page})
    ccall((:ogg_page_packets,libogg),Cint,(Ptr{ogg_page},),og)
end

function ogg_packet_clear(op::Ptr{ogg_packet})
    ccall((:ogg_packet_clear,libogg),Void,(Ptr{ogg_packet},),op)
end

function oggz_table_new()
    ccall((:oggz_table_new,liboggz),Ptr{OggzTable},())
end

function oggz_table_delete(table::Ptr{OggzTable})
    ccall((:oggz_table_delete,liboggz),Void,(Ptr{OggzTable},),table)
end

function oggz_table_insert(table::Ptr{OggzTable},key::Clong,data::Ptr{Void})
    ccall((:oggz_table_insert,liboggz),Ptr{Void},(Ptr{OggzTable},Clong,Ptr{Void}),table,key,data)
end

function oggz_table_remove(table::Ptr{OggzTable},key::Clong)
    ccall((:oggz_table_remove,liboggz),Cint,(Ptr{OggzTable},Clong),table,key)
end

function oggz_table_lookup(table::Ptr{OggzTable},key::Clong)
    ccall((:oggz_table_lookup,liboggz),Ptr{Void},(Ptr{OggzTable},Clong),table,key)
end

function oggz_table_size(table::Ptr{OggzTable})
    ccall((:oggz_table_size,liboggz),Cint,(Ptr{OggzTable},),table)
end

function oggz_table_nth(table::Ptr{OggzTable},n::Cint,key::Ptr{Clong})
    ccall((:oggz_table_nth,liboggz),Ptr{Void},(Ptr{OggzTable},Cint,Ptr{Clong}),table,n,key)
end

function oggz_new(flags::Cint)
    ccall((:oggz_new,liboggz),Ptr{OGGZ},(Cint,),flags)
end

function oggz_open(filename::Ptr{UInt8},flags::Cint)
    ccall((:oggz_open,liboggz),Ptr{OGGZ},(Ptr{UInt8},Cint),filename,flags)
end

function oggz_open_stdio(file::Ptr{FILE},flags::Cint)
    ccall((:oggz_open_stdio,liboggz),Ptr{OGGZ},(Ptr{FILE},Cint),file,flags)
end

function oggz_flush(oggz::Ptr{OGGZ})
    ccall((:oggz_flush,liboggz),Cint,(Ptr{OGGZ},),oggz)
end

function oggz_run(oggz::Ptr{OGGZ})
    ccall((:oggz_run,liboggz),Clong,(Ptr{OGGZ},),oggz)
end

function oggz_run_set_blocksize(oggz::Ptr{OGGZ},blocksize::Clong)
    ccall((:oggz_run_set_blocksize,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,blocksize)
end

function oggz_close(oggz::Ptr{OGGZ})
    ccall((:oggz_close,liboggz),Cint,(Ptr{OGGZ},),oggz)
end

function oggz_get_bos(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_get_bos,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_get_eos(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_get_eos,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_get_numtracks(oggz::Ptr{OGGZ})
    ccall((:oggz_get_numtracks,liboggz),Cint,(Ptr{OGGZ},),oggz)
end

function oggz_serialno_new(oggz::Ptr{OGGZ})
    ccall((:oggz_serialno_new,liboggz),Clong,(Ptr{OGGZ},),oggz)
end

function oggz_content_type(content::OggzStreamContent)
    ccall((:oggz_content_type,liboggz),Ptr{UInt8},(OggzStreamContent,),content)
end

function oggz_set_read_callback(oggz::Ptr{OGGZ},serialno::Clong,read_packet::OggzReadPacket,user_data::Ptr{Void})
    ccall((:oggz_set_read_callback,liboggz),Cint,(Ptr{OGGZ},Clong,OggzReadPacket,Ptr{Void}),oggz,serialno,read_packet,user_data)
end

function oggz_set_read_page(oggz::Ptr{OGGZ},serialno::Clong,read_page::OggzReadPage,user_data::Ptr{Void})
    ccall((:oggz_set_read_page,liboggz),Cint,(Ptr{OGGZ},Clong,OggzReadPage,Ptr{Void}),oggz,serialno,read_page,user_data)
end

function oggz_read(oggz::Ptr{OGGZ},n::Clong)
    ccall((:oggz_read,liboggz),Clong,(Ptr{OGGZ},Clong),oggz,n)
end

function oggz_read_input(oggz::Ptr{OGGZ},buf::Ptr{Cuchar},n::Clong)
    ccall((:oggz_read_input,liboggz),Clong,(Ptr{OGGZ},Ptr{Cuchar},Clong),oggz,buf,n)
end

function oggz_purge(oggz::Ptr{OGGZ})
    ccall((:oggz_purge,liboggz),Cint,(Ptr{OGGZ},),oggz)
end

function oggz_stream_get_content(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_content,liboggz),OggzStreamContent,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_stream_get_content_type(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_content_type,liboggz),Ptr{UInt8},(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_stream_get_numheaders(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_numheaders,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_stream_get_content(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_content,liboggz),OggzStreamContent,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_stream_get_content_type(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_content_type,liboggz),Ptr{UInt8},(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_stream_get_numheaders(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_stream_get_numheaders,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_tell_units(oggz::Ptr{OGGZ})
    ccall((:oggz_tell_units,liboggz),ogg_int64_t,(Ptr{OGGZ},),oggz)
end

function oggz_seek_units(oggz::Ptr{OGGZ},units::ogg_int64_t,whence::Cint)
    ccall((:oggz_seek_units,liboggz),ogg_int64_t,(Ptr{OGGZ},ogg_int64_t,Cint),oggz,units,whence)
end

function oggz_tell_granulepos(oggz::Ptr{OGGZ})
    ccall((:oggz_tell_granulepos,liboggz),ogg_int64_t,(Ptr{OGGZ},),oggz)
end

function oggz_tell(oggz::Ptr{OGGZ})
    ccall((:oggz_tell,liboggz),oggz_off_t,(Ptr{OGGZ},),oggz)
end

function oggz_seek(oggz::Ptr{OGGZ},offset::oggz_off_t,whence::Cint)
    ccall((:oggz_seek,liboggz),oggz_off_t,(Ptr{OGGZ},oggz_off_t,Cint),oggz,offset,whence)
end

function oggz_get_preroll(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_get_preroll,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_set_preroll(oggz::Ptr{OGGZ},serialno::Clong,preroll::Cint)
    ccall((:oggz_set_preroll,liboggz),Cint,(Ptr{OGGZ},Clong,Cint),oggz,serialno,preroll)
end

function oggz_get_granuleshift(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_get_granuleshift,liboggz),Cint,(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_set_granuleshift(oggz::Ptr{OGGZ},serialno::Clong,granuleshift::Cint)
    ccall((:oggz_set_granuleshift,liboggz),Cint,(Ptr{OGGZ},Clong,Cint),oggz,serialno,granuleshift)
end

function oggz_get_granulerate(oggz::Ptr{OGGZ},serialno::Clong,granulerate_n::Ptr{ogg_int64_t},granulerate_d::Ptr{ogg_int64_t})
    ccall((:oggz_get_granulerate,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{ogg_int64_t},Ptr{ogg_int64_t}),oggz,serialno,granulerate_n,granulerate_d)
end

function oggz_set_granulerate(oggz::Ptr{OGGZ},serialno::Clong,granule_rate_numerator::ogg_int64_t,granule_rate_denominator::ogg_int64_t)
    ccall((:oggz_set_granulerate,liboggz),Cint,(Ptr{OGGZ},Clong,ogg_int64_t,ogg_int64_t),oggz,serialno,granule_rate_numerator,granule_rate_denominator)
end

function oggz_set_metric(oggz::Ptr{OGGZ},serialno::Clong,metric::OggzMetric,user_data::Ptr{Void})
    ccall((:oggz_set_metric,liboggz),Cint,(Ptr{OGGZ},Clong,OggzMetric,Ptr{Void}),oggz,serialno,metric,user_data)
end

function oggz_set_data_start(oggz::Ptr{OGGZ},offset::oggz_off_t)
    ccall((:oggz_set_data_start,liboggz),Cint,(Ptr{OGGZ},oggz_off_t),oggz,offset)
end

function oggz_bounded_seek_set(oggz::Ptr{OGGZ},unit_target::ogg_int64_t,offset_begin::ogg_int64_t,offset_end::ogg_int64_t)
    ccall((:oggz_bounded_seek_set,liboggz),ogg_int64_t,(Ptr{OGGZ},ogg_int64_t,ogg_int64_t,ogg_int64_t),oggz,unit_target,offset_begin,offset_end)
end

function oggz_write_set_hungry_callback(oggz::Ptr{OGGZ},hungry::OggzWriteHungry,only_when_empty::Cint,user_data::Ptr{Void})
    ccall((:oggz_write_set_hungry_callback,liboggz),Cint,(Ptr{OGGZ},OggzWriteHungry,Cint,Ptr{Void}),oggz,hungry,only_when_empty,user_data)
end

function oggz_write_feed(oggz::Ptr{OGGZ},op::Ptr{ogg_packet},serialno::Clong,flush::Cint,guard::Ptr{Cint})
    ccall((:oggz_write_feed,liboggz),Cint,(Ptr{OGGZ},Ptr{ogg_packet},Clong,Cint,Ptr{Cint}),oggz,op,serialno,flush,guard)
end

function oggz_write_output(oggz::Ptr{OGGZ},buf::Ptr{Cuchar},n::Clong)
    ccall((:oggz_write_output,liboggz),Clong,(Ptr{OGGZ},Ptr{Cuchar},Clong),oggz,buf,n)
end

function oggz_write(oggz::Ptr{OGGZ},n::Clong)
    ccall((:oggz_write,liboggz),Clong,(Ptr{OGGZ},Clong),oggz,n)
end

function oggz_write_get_next_page_size(oggz::Ptr{OGGZ})
    ccall((:oggz_write_get_next_page_size,liboggz),Clong,(Ptr{OGGZ},),oggz)
end

function oggz_io_set_read(oggz::Ptr{OGGZ},read::Cint,user_handle::Ptr{Void})
    ccall((:oggz_io_set_read,liboggz),Cint,(Ptr{OGGZ},Cint,Ptr{Void}),oggz,read,user_handle)
end

function oggz_io_get_read_user_handle(oggz::Ptr{OGGZ})
    ccall((:oggz_io_get_read_user_handle,liboggz),Ptr{Void},(Ptr{OGGZ},),oggz)
end

function oggz_io_set_write(oggz::Ptr{OGGZ},write::OggzIOWrite,user_handle::Ptr{Void})
    ccall((:oggz_io_set_write,liboggz),Cint,(Ptr{OGGZ},OggzIOWrite,Ptr{Void}),oggz,write,user_handle)
end

function oggz_io_get_write_user_handle(oggz::Ptr{OGGZ})
    ccall((:oggz_io_get_write_user_handle,liboggz),Ptr{Void},(Ptr{OGGZ},),oggz)
end

function oggz_io_set_seek(oggz::Ptr{OGGZ},seek::OggzIOSeek,user_handle::Ptr{Void})
    ccall((:oggz_io_set_seek,liboggz),Cint,(Ptr{OGGZ},OggzIOSeek,Ptr{Void}),oggz,seek,user_handle)
end

function oggz_io_get_seek_user_handle(oggz::Ptr{OGGZ})
    ccall((:oggz_io_get_seek_user_handle,liboggz),Ptr{Void},(Ptr{OGGZ},),oggz)
end

function oggz_io_set_tell(oggz::Ptr{OGGZ},tell::OggzIOTell,user_handle::Ptr{Void})
    ccall((:oggz_io_set_tell,liboggz),Cint,(Ptr{OGGZ},OggzIOTell,Ptr{Void}),oggz,tell,user_handle)
end

function oggz_io_get_tell_user_handle(oggz::Ptr{OGGZ})
    ccall((:oggz_io_get_tell_user_handle,liboggz),Ptr{Void},(Ptr{OGGZ},),oggz)
end

function oggz_io_set_flush(oggz::Ptr{OGGZ},flush::OggzIOFlush,user_handle::Ptr{Void})
    ccall((:oggz_io_set_flush,liboggz),Cint,(Ptr{OGGZ},OggzIOFlush,Ptr{Void}),oggz,flush,user_handle)
end

function oggz_io_get_flush_user_handle(oggz::Ptr{OGGZ})
    ccall((:oggz_io_get_flush_user_handle,liboggz),Ptr{Void},(Ptr{OGGZ},),oggz)
end

function oggz_comment_get_vendor(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_comment_get_vendor,liboggz),Ptr{UInt8},(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_comment_set_vendor(oggz::Ptr{OGGZ},serialno::Clong,vendor_string::Ptr{UInt8})
    ccall((:oggz_comment_set_vendor,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{UInt8}),oggz,serialno,vendor_string)
end

function oggz_comment_first(oggz::Ptr{OGGZ},serialno::Clong)
    ccall((:oggz_comment_first,liboggz),Ptr{OggzComment},(Ptr{OGGZ},Clong),oggz,serialno)
end

function oggz_comment_next(oggz::Ptr{OGGZ},serialno::Clong,comment::Ptr{OggzComment})
    ccall((:oggz_comment_next,liboggz),Ptr{OggzComment},(Ptr{OGGZ},Clong,Ptr{OggzComment}),oggz,serialno,comment)
end

function oggz_comment_first_byname(oggz::Ptr{OGGZ},serialno::Clong,name::Ptr{UInt8})
    ccall((:oggz_comment_first_byname,liboggz),Ptr{OggzComment},(Ptr{OGGZ},Clong,Ptr{UInt8}),oggz,serialno,name)
end

function oggz_comment_next_byname(oggz::Ptr{OGGZ},serialno::Clong,comment::Ptr{OggzComment})
    ccall((:oggz_comment_next_byname,liboggz),Ptr{OggzComment},(Ptr{OGGZ},Clong,Ptr{OggzComment}),oggz,serialno,comment)
end

function oggz_comment_add(oggz::Ptr{OGGZ},serialno::Clong,comment::Ptr{OggzComment})
    ccall((:oggz_comment_add,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{OggzComment}),oggz,serialno,comment)
end

function oggz_comment_add_byname(oggz::Ptr{OGGZ},serialno::Clong,name::Ptr{UInt8},value::Ptr{UInt8})
    ccall((:oggz_comment_add_byname,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{UInt8},Ptr{UInt8}),oggz,serialno,name,value)
end

function oggz_comment_remove(oggz::Ptr{OGGZ},serialno::Clong,comment::Ptr{OggzComment})
    ccall((:oggz_comment_remove,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{OggzComment}),oggz,serialno,comment)
end

function oggz_comment_remove_byname(oggz::Ptr{OGGZ},serialno::Clong,name::Ptr{UInt8})
    ccall((:oggz_comment_remove_byname,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{UInt8}),oggz,serialno,name)
end

function oggz_comments_generate(oggz::Ptr{OGGZ},serialno::Clong,FLAC_final_metadata_block::Cint)
    ccall((:oggz_comments_generate,liboggz),Ptr{ogg_packet},(Ptr{OGGZ},Clong,Cint),oggz,serialno,FLAC_final_metadata_block)
end

function oggz_comments_copy(src::Ptr{OGGZ},src_serialno::Clong,dest::Ptr{OGGZ},dest_serialno::Clong)
    ccall((:oggz_comments_copy,liboggz),Cint,(Ptr{OGGZ},Clong,Ptr{OGGZ},Clong),src,src_serialno,dest,dest_serialno)
end

function oggz_packet_destroy(packet::Ptr{ogg_packet})
    ccall((:oggz_packet_destroy,liboggz),Void,(Ptr{ogg_packet},),packet)
end

function oggz_set_metric_linear(oggz::Ptr{OGGZ},serialno::Clong,granule_rate_numerator::ogg_int64_t,granule_rate_denominator::ogg_int64_t)
    ccall((:oggz_set_metric_linear,oggz_deprecated),Cint,(Ptr{OGGZ},Clong,ogg_int64_t,ogg_int64_t),oggz,serialno,granule_rate_numerator,granule_rate_denominator)
end

function oggz_comment_generate(oggz::Ptr{OGGZ},serialno::Clong,packet_type::OggzStreamContent,FLAC_final_metadata_block::Cint)
    ccall((:oggz_comment_generate,oggz_deprecated),Ptr{ogg_packet},(Ptr{OGGZ},Clong,OggzStreamContent,Cint),oggz,serialno,packet_type,FLAC_final_metadata_block)
end

function FLAC__format_sample_rate_is_valid(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_valid,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_blocksize_is_subset(blocksize::UInt32,sample_rate::UInt32)
    ccall((:FLAC__format_blocksize_is_subset,libFLAC),FLAC__bool,(UInt32,UInt32),blocksize,sample_rate)
end

function FLAC__format_sample_rate_is_subset(sample_rate::UInt32)
    ccall((:FLAC__format_sample_rate_is_subset,libFLAC),FLAC__bool,(UInt32,),sample_rate)
end

function FLAC__format_vorbiscomment_entry_name_is_legal(name::Ptr{UInt8})
    ccall((:FLAC__format_vorbiscomment_entry_name_is_legal,libFLAC),FLAC__bool,(Ptr{UInt8},),name)
end

function FLAC__format_vorbiscomment_entry_value_is_legal(value::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_value_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),value,length)
end

function FLAC__format_vorbiscomment_entry_is_legal(entry::Ptr{FLAC__byte},length::UInt32)
    ccall((:FLAC__format_vorbiscomment_entry_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__byte},UInt32),entry,length)
end

function FLAC__format_seektable_is_legal(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_seektable_sort(seek_table::Ptr{FLAC__StreamMetadata_SeekTable})
    ccall((:FLAC__format_seektable_sort,libFLAC),UInt32,(Ptr{FLAC__StreamMetadata_SeekTable},),seek_table)
end

function FLAC__format_cuesheet_is_legal(cue_sheet::Ptr{FLAC__StreamMetadata_CueSheet},check_cd_da_subset::FLAC__bool,violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_cuesheet_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_CueSheet},FLAC__bool,Ptr{Ptr{UInt8}}),cue_sheet,check_cd_da_subset,violation)
end

function FLAC__format_picture_is_legal(picture::Ptr{FLAC__StreamMetadata_Picture},violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__format_picture_is_legal,libFLAC),FLAC__bool,(Ptr{FLAC__StreamMetadata_Picture},Ptr{Ptr{UInt8}}),picture,violation)
end

function FLAC__metadata_get_streaminfo(filename::Ptr{UInt8},streaminfo::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_get_streaminfo,metadata),FLAC__bool,(Ptr{UInt8},Ptr{FLAC__StreamMetadata}),filename,streaminfo)
end

function FLAC__metadata_get_tags(filename::Ptr{UInt8},tags::Ptr{Ptr{FLAC__StreamMetadata}})
    ccall((:FLAC__metadata_get_tags,metadata),FLAC__bool,(Ptr{UInt8},Ptr{Ptr{FLAC__StreamMetadata}}),filename,tags)
end

function FLAC__metadata_get_cuesheet(filename::Ptr{UInt8},cuesheet::Ptr{Ptr{FLAC__StreamMetadata}})
    ccall((:FLAC__metadata_get_cuesheet,metadata),FLAC__bool,(Ptr{UInt8},Ptr{Ptr{FLAC__StreamMetadata}}),filename,cuesheet)
end

function FLAC__metadata_get_picture(filename::Ptr{UInt8},picture::Ptr{Ptr{FLAC__StreamMetadata}},_type::FLAC__StreamMetadata_Picture_Type,mime_type::Ptr{UInt8},description::Ptr{FLAC__byte},max_width::UInt32,max_height::UInt32,max_depth::UInt32,max_colors::UInt32)
    ccall((:FLAC__metadata_get_picture,metadata),FLAC__bool,(Ptr{UInt8},Ptr{Ptr{FLAC__StreamMetadata}},FLAC__StreamMetadata_Picture_Type,Ptr{UInt8},Ptr{FLAC__byte},UInt32,UInt32,UInt32,UInt32),filename,picture,_type,mime_type,description,max_width,max_height,max_depth,max_colors)
end

function FLAC__metadata_simple_iterator_new()
    ccall((:FLAC__metadata_simple_iterator_new,metadata),Ptr{FLAC__Metadata_SimpleIterator},())
end

function FLAC__metadata_simple_iterator_delete(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_delete,metadata),Void,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_status(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_status,metadata),FLAC__Metadata_SimpleIteratorStatus,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_init(iterator::Ptr{FLAC__Metadata_SimpleIterator},filename::Ptr{UInt8},read_only::FLAC__bool,preserve_file_stats::FLAC__bool)
    ccall((:FLAC__metadata_simple_iterator_init,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},Ptr{UInt8},FLAC__bool,FLAC__bool),iterator,filename,read_only,preserve_file_stats)
end

function FLAC__metadata_simple_iterator_is_writable(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_is_writable,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_next(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_next,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_prev(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_prev,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_is_last(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_is_last,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_get_block_offset(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_get_block_offset,metadata),off_t,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_get_block_type(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_get_block_type,metadata),FLAC__MetadataType,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_get_block_length(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_get_block_length,metadata),UInt32,(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_get_application_id(iterator::Ptr{FLAC__Metadata_SimpleIterator},id::Ptr{FLAC__byte})
    ccall((:FLAC__metadata_simple_iterator_get_application_id,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},Ptr{FLAC__byte}),iterator,id)
end

function FLAC__metadata_simple_iterator_get_block(iterator::Ptr{FLAC__Metadata_SimpleIterator})
    ccall((:FLAC__metadata_simple_iterator_get_block,metadata),Ptr{FLAC__StreamMetadata},(Ptr{FLAC__Metadata_SimpleIterator},),iterator)
end

function FLAC__metadata_simple_iterator_set_block(iterator::Ptr{FLAC__Metadata_SimpleIterator},block::Ptr{FLAC__StreamMetadata},use_padding::FLAC__bool)
    ccall((:FLAC__metadata_simple_iterator_set_block,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},Ptr{FLAC__StreamMetadata},FLAC__bool),iterator,block,use_padding)
end

function FLAC__metadata_simple_iterator_insert_block_after(iterator::Ptr{FLAC__Metadata_SimpleIterator},block::Ptr{FLAC__StreamMetadata},use_padding::FLAC__bool)
    ccall((:FLAC__metadata_simple_iterator_insert_block_after,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},Ptr{FLAC__StreamMetadata},FLAC__bool),iterator,block,use_padding)
end

function FLAC__metadata_simple_iterator_delete_block(iterator::Ptr{FLAC__Metadata_SimpleIterator},use_padding::FLAC__bool)
    ccall((:FLAC__metadata_simple_iterator_delete_block,metadata),FLAC__bool,(Ptr{FLAC__Metadata_SimpleIterator},FLAC__bool),iterator,use_padding)
end

function FLAC__metadata_chain_new()
    ccall((:FLAC__metadata_chain_new,metadata),Ptr{FLAC__Metadata_Chain},())
end

function FLAC__metadata_chain_delete(chain::Ptr{FLAC__Metadata_Chain})
    ccall((:FLAC__metadata_chain_delete,metadata),Void,(Ptr{FLAC__Metadata_Chain},),chain)
end

function FLAC__metadata_chain_status(chain::Ptr{FLAC__Metadata_Chain})
    ccall((:FLAC__metadata_chain_status,metadata),FLAC__Metadata_ChainStatus,(Ptr{FLAC__Metadata_Chain},),chain)
end

function FLAC__metadata_chain_read(chain::Ptr{FLAC__Metadata_Chain},filename::Ptr{UInt8})
    ccall((:FLAC__metadata_chain_read,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},Ptr{UInt8}),chain,filename)
end

function FLAC__metadata_chain_read_ogg(chain::Ptr{FLAC__Metadata_Chain},filename::Ptr{UInt8})
    ccall((:FLAC__metadata_chain_read_ogg,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},Ptr{UInt8}),chain,filename)
end

function FLAC__metadata_chain_read_with_callbacks(chain::Ptr{FLAC__Metadata_Chain},handle::FLAC__IOHandle,callbacks::FLAC__IOCallbacks)
    ccall((:FLAC__metadata_chain_read_with_callbacks,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__IOHandle,FLAC__IOCallbacks),chain,handle,callbacks)
end

function FLAC__metadata_chain_read_ogg_with_callbacks(chain::Ptr{FLAC__Metadata_Chain},handle::FLAC__IOHandle,callbacks::FLAC__IOCallbacks)
    ccall((:FLAC__metadata_chain_read_ogg_with_callbacks,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__IOHandle,FLAC__IOCallbacks),chain,handle,callbacks)
end

function FLAC__metadata_chain_check_if_tempfile_needed(chain::Ptr{FLAC__Metadata_Chain},use_padding::FLAC__bool)
    ccall((:FLAC__metadata_chain_check_if_tempfile_needed,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__bool),chain,use_padding)
end

function FLAC__metadata_chain_write(chain::Ptr{FLAC__Metadata_Chain},use_padding::FLAC__bool,preserve_file_stats::FLAC__bool)
    ccall((:FLAC__metadata_chain_write,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__bool,FLAC__bool),chain,use_padding,preserve_file_stats)
end

function FLAC__metadata_chain_write_with_callbacks(chain::Ptr{FLAC__Metadata_Chain},use_padding::FLAC__bool,handle::FLAC__IOHandle,callbacks::FLAC__IOCallbacks)
    ccall((:FLAC__metadata_chain_write_with_callbacks,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__bool,FLAC__IOHandle,FLAC__IOCallbacks),chain,use_padding,handle,callbacks)
end

function FLAC__metadata_chain_write_with_callbacks_and_tempfile(chain::Ptr{FLAC__Metadata_Chain},use_padding::FLAC__bool,handle::FLAC__IOHandle,callbacks::FLAC__IOCallbacks,temp_handle::FLAC__IOHandle,temp_callbacks::FLAC__IOCallbacks)
    ccall((:FLAC__metadata_chain_write_with_callbacks_and_tempfile,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Chain},FLAC__bool,FLAC__IOHandle,FLAC__IOCallbacks,FLAC__IOHandle,FLAC__IOCallbacks),chain,use_padding,handle,callbacks,temp_handle,temp_callbacks)
end

function FLAC__metadata_chain_merge_padding(chain::Ptr{FLAC__Metadata_Chain})
    ccall((:FLAC__metadata_chain_merge_padding,metadata),Void,(Ptr{FLAC__Metadata_Chain},),chain)
end

function FLAC__metadata_chain_sort_padding(chain::Ptr{FLAC__Metadata_Chain})
    ccall((:FLAC__metadata_chain_sort_padding,metadata),Void,(Ptr{FLAC__Metadata_Chain},),chain)
end

function FLAC__metadata_iterator_new()
    ccall((:FLAC__metadata_iterator_new,metadata),Ptr{FLAC__Metadata_Iterator},())
end

function FLAC__metadata_iterator_delete(iterator::Ptr{FLAC__Metadata_Iterator})
    ccall((:FLAC__metadata_iterator_delete,metadata),Void,(Ptr{FLAC__Metadata_Iterator},),iterator)
end

function FLAC__metadata_iterator_init(iterator::Ptr{FLAC__Metadata_Iterator},chain::Ptr{FLAC__Metadata_Chain})
    ccall((:FLAC__metadata_iterator_init,metadata),Void,(Ptr{FLAC__Metadata_Iterator},Ptr{FLAC__Metadata_Chain}),iterator,chain)
end

function FLAC__metadata_iterator_next(iterator::Ptr{FLAC__Metadata_Iterator})
    ccall((:FLAC__metadata_iterator_next,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},),iterator)
end

function FLAC__metadata_iterator_prev(iterator::Ptr{FLAC__Metadata_Iterator})
    ccall((:FLAC__metadata_iterator_prev,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},),iterator)
end

function FLAC__metadata_iterator_get_block_type(iterator::Ptr{FLAC__Metadata_Iterator})
    ccall((:FLAC__metadata_iterator_get_block_type,metadata),FLAC__MetadataType,(Ptr{FLAC__Metadata_Iterator},),iterator)
end

function FLAC__metadata_iterator_get_block(iterator::Ptr{FLAC__Metadata_Iterator})
    ccall((:FLAC__metadata_iterator_get_block,metadata),Ptr{FLAC__StreamMetadata},(Ptr{FLAC__Metadata_Iterator},),iterator)
end

function FLAC__metadata_iterator_set_block(iterator::Ptr{FLAC__Metadata_Iterator},block::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_iterator_set_block,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},Ptr{FLAC__StreamMetadata}),iterator,block)
end

function FLAC__metadata_iterator_delete_block(iterator::Ptr{FLAC__Metadata_Iterator},replace_with_padding::FLAC__bool)
    ccall((:FLAC__metadata_iterator_delete_block,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},FLAC__bool),iterator,replace_with_padding)
end

function FLAC__metadata_iterator_insert_block_before(iterator::Ptr{FLAC__Metadata_Iterator},block::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_iterator_insert_block_before,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},Ptr{FLAC__StreamMetadata}),iterator,block)
end

function FLAC__metadata_iterator_insert_block_after(iterator::Ptr{FLAC__Metadata_Iterator},block::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_iterator_insert_block_after,metadata),FLAC__bool,(Ptr{FLAC__Metadata_Iterator},Ptr{FLAC__StreamMetadata}),iterator,block)
end

function FLAC__metadata_object_new(_type::FLAC__MetadataType)
    ccall((:FLAC__metadata_object_new,metadata),Ptr{FLAC__StreamMetadata},(FLAC__MetadataType,),_type)
end

function FLAC__metadata_object_clone(object::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_object_clone,metadata),Ptr{FLAC__StreamMetadata},(Ptr{FLAC__StreamMetadata},),object)
end

function FLAC__metadata_object_delete(object::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_object_delete,metadata),Void,(Ptr{FLAC__StreamMetadata},),object)
end

function FLAC__metadata_object_is_equal(block1::Ptr{FLAC__StreamMetadata},block2::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_object_is_equal,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{FLAC__StreamMetadata}),block1,block2)
end

function FLAC__metadata_object_application_set_data(object::Ptr{FLAC__StreamMetadata},data::Ptr{FLAC__byte},length::UInt32,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_application_set_data,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{FLAC__byte},UInt32,FLAC__bool),object,data,length,copy)
end

function FLAC__metadata_object_seektable_resize_points(object::Ptr{FLAC__StreamMetadata},new_num_points::UInt32)
    ccall((:FLAC__metadata_object_seektable_resize_points,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,new_num_points)
end

function FLAC__metadata_object_seektable_set_point(object::Ptr{FLAC__StreamMetadata},point_num::UInt32,point::FLAC__StreamMetadata_SeekPoint)
    ccall((:FLAC__metadata_object_seektable_set_point,metadata),Void,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__StreamMetadata_SeekPoint),object,point_num,point)
end

function FLAC__metadata_object_seektable_insert_point(object::Ptr{FLAC__StreamMetadata},point_num::UInt32,point::FLAC__StreamMetadata_SeekPoint)
    ccall((:FLAC__metadata_object_seektable_insert_point,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__StreamMetadata_SeekPoint),object,point_num,point)
end

function FLAC__metadata_object_seektable_delete_point(object::Ptr{FLAC__StreamMetadata},point_num::UInt32)
    ccall((:FLAC__metadata_object_seektable_delete_point,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,point_num)
end

function FLAC__metadata_object_seektable_is_legal(object::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_object_seektable_is_legal,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},),object)
end

function FLAC__metadata_object_seektable_template_append_placeholders(object::Ptr{FLAC__StreamMetadata},num::UInt32)
    ccall((:FLAC__metadata_object_seektable_template_append_placeholders,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,num)
end

function FLAC__metadata_object_seektable_template_append_point(object::Ptr{FLAC__StreamMetadata},sample_number::FLAC__uint64)
    ccall((:FLAC__metadata_object_seektable_template_append_point,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__uint64),object,sample_number)
end

function FLAC__metadata_object_seektable_template_append_points(object::Ptr{FLAC__StreamMetadata},sample_numbers::Ptr{FLAC__uint64},num::UInt32)
    ccall((:FLAC__metadata_object_seektable_template_append_points,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{FLAC__uint64},UInt32),object,sample_numbers,num)
end

function FLAC__metadata_object_seektable_template_append_spaced_points(object::Ptr{FLAC__StreamMetadata},num::UInt32,total_samples::FLAC__uint64)
    ccall((:FLAC__metadata_object_seektable_template_append_spaced_points,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__uint64),object,num,total_samples)
end

function FLAC__metadata_object_seektable_template_append_spaced_points_by_samples(object::Ptr{FLAC__StreamMetadata},samples::UInt32,total_samples::FLAC__uint64)
    ccall((:FLAC__metadata_object_seektable_template_append_spaced_points_by_samples,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__uint64),object,samples,total_samples)
end

function FLAC__metadata_object_seektable_template_sort(object::Ptr{FLAC__StreamMetadata},compact::FLAC__bool)
    ccall((:FLAC__metadata_object_seektable_template_sort,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__bool),object,compact)
end

function FLAC__metadata_object_vorbiscomment_set_vendor_string(object::Ptr{FLAC__StreamMetadata},entry::FLAC__StreamMetadata_VorbisComment_Entry,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_vorbiscomment_set_vendor_string,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__StreamMetadata_VorbisComment_Entry,FLAC__bool),object,entry,copy)
end

function FLAC__metadata_object_vorbiscomment_resize_comments(object::Ptr{FLAC__StreamMetadata},new_num_comments::UInt32)
    ccall((:FLAC__metadata_object_vorbiscomment_resize_comments,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,new_num_comments)
end

function FLAC__metadata_object_vorbiscomment_set_comment(object::Ptr{FLAC__StreamMetadata},comment_num::UInt32,entry::FLAC__StreamMetadata_VorbisComment_Entry,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_vorbiscomment_set_comment,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__StreamMetadata_VorbisComment_Entry,FLAC__bool),object,comment_num,entry,copy)
end

function FLAC__metadata_object_vorbiscomment_insert_comment(object::Ptr{FLAC__StreamMetadata},comment_num::UInt32,entry::FLAC__StreamMetadata_VorbisComment_Entry,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_vorbiscomment_insert_comment,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,FLAC__StreamMetadata_VorbisComment_Entry,FLAC__bool),object,comment_num,entry,copy)
end

function FLAC__metadata_object_vorbiscomment_append_comment(object::Ptr{FLAC__StreamMetadata},entry::FLAC__StreamMetadata_VorbisComment_Entry,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_vorbiscomment_append_comment,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__StreamMetadata_VorbisComment_Entry,FLAC__bool),object,entry,copy)
end

function FLAC__metadata_object_vorbiscomment_replace_comment(object::Ptr{FLAC__StreamMetadata},entry::FLAC__StreamMetadata_VorbisComment_Entry,all::FLAC__bool,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_vorbiscomment_replace_comment,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__StreamMetadata_VorbisComment_Entry,FLAC__bool,FLAC__bool),object,entry,all,copy)
end

function FLAC__metadata_object_vorbiscomment_delete_comment(object::Ptr{FLAC__StreamMetadata},comment_num::UInt32)
    ccall((:FLAC__metadata_object_vorbiscomment_delete_comment,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,comment_num)
end

function FLAC__metadata_object_vorbiscomment_entry_from_name_value_pair(entry::Ptr{FLAC__StreamMetadata_VorbisComment_Entry},field_name::Ptr{UInt8},field_value::Ptr{UInt8})
    ccall((:FLAC__metadata_object_vorbiscomment_entry_from_name_value_pair,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata_VorbisComment_Entry},Ptr{UInt8},Ptr{UInt8}),entry,field_name,field_value)
end

function FLAC__metadata_object_vorbiscomment_entry_to_name_value_pair(entry::FLAC__StreamMetadata_VorbisComment_Entry,field_name::Ptr{Ptr{UInt8}},field_value::Ptr{Ptr{UInt8}})
    ccall((:FLAC__metadata_object_vorbiscomment_entry_to_name_value_pair,metadata),FLAC__bool,(FLAC__StreamMetadata_VorbisComment_Entry,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}}),entry,field_name,field_value)
end

function FLAC__metadata_object_vorbiscomment_entry_matches(entry::FLAC__StreamMetadata_VorbisComment_Entry,field_name::Ptr{UInt8},field_name_length::UInt32)
    ccall((:FLAC__metadata_object_vorbiscomment_entry_matches,metadata),FLAC__bool,(FLAC__StreamMetadata_VorbisComment_Entry,Ptr{UInt8},UInt32),entry,field_name,field_name_length)
end

function FLAC__metadata_object_vorbiscomment_find_entry_from(object::Ptr{FLAC__StreamMetadata},offset::UInt32,field_name::Ptr{UInt8})
    ccall((:FLAC__metadata_object_vorbiscomment_find_entry_from,metadata),Cint,(Ptr{FLAC__StreamMetadata},UInt32,Ptr{UInt8}),object,offset,field_name)
end

function FLAC__metadata_object_vorbiscomment_remove_entry_matching(object::Ptr{FLAC__StreamMetadata},field_name::Ptr{UInt8})
    ccall((:FLAC__metadata_object_vorbiscomment_remove_entry_matching,metadata),Cint,(Ptr{FLAC__StreamMetadata},Ptr{UInt8}),object,field_name)
end

function FLAC__metadata_object_vorbiscomment_remove_entries_matching(object::Ptr{FLAC__StreamMetadata},field_name::Ptr{UInt8})
    ccall((:FLAC__metadata_object_vorbiscomment_remove_entries_matching,metadata),Cint,(Ptr{FLAC__StreamMetadata},Ptr{UInt8}),object,field_name)
end

function FLAC__metadata_object_cuesheet_track_new()
    ccall((:FLAC__metadata_object_cuesheet_track_new,metadata),Ptr{FLAC__StreamMetadata_CueSheet_Track},())
end

function FLAC__metadata_object_cuesheet_track_clone(object::Ptr{FLAC__StreamMetadata_CueSheet_Track})
    ccall((:FLAC__metadata_object_cuesheet_track_clone,metadata),Ptr{FLAC__StreamMetadata_CueSheet_Track},(Ptr{FLAC__StreamMetadata_CueSheet_Track},),object)
end

function FLAC__metadata_object_cuesheet_track_delete(object::Ptr{FLAC__StreamMetadata_CueSheet_Track})
    ccall((:FLAC__metadata_object_cuesheet_track_delete,metadata),Void,(Ptr{FLAC__StreamMetadata_CueSheet_Track},),object)
end

function FLAC__metadata_object_cuesheet_track_resize_indices(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,new_num_indices::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_track_resize_indices,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,UInt32),object,track_num,new_num_indices)
end

function FLAC__metadata_object_cuesheet_track_insert_index(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,index_num::UInt32,index::FLAC__StreamMetadata_CueSheet_Index)
    ccall((:FLAC__metadata_object_cuesheet_track_insert_index,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,UInt32,FLAC__StreamMetadata_CueSheet_Index),object,track_num,index_num,index)
end

function FLAC__metadata_object_cuesheet_track_insert_blank_index(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,index_num::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_track_insert_blank_index,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,UInt32),object,track_num,index_num)
end

function FLAC__metadata_object_cuesheet_track_delete_index(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,index_num::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_track_delete_index,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,UInt32),object,track_num,index_num)
end

function FLAC__metadata_object_cuesheet_resize_tracks(object::Ptr{FLAC__StreamMetadata},new_num_tracks::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_resize_tracks,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,new_num_tracks)
end

function FLAC__metadata_object_cuesheet_set_track(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,track::Ptr{FLAC__StreamMetadata_CueSheet_Track},copy::FLAC__bool)
    ccall((:FLAC__metadata_object_cuesheet_set_track,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,Ptr{FLAC__StreamMetadata_CueSheet_Track},FLAC__bool),object,track_num,track,copy)
end

function FLAC__metadata_object_cuesheet_insert_track(object::Ptr{FLAC__StreamMetadata},track_num::UInt32,track::Ptr{FLAC__StreamMetadata_CueSheet_Track},copy::FLAC__bool)
    ccall((:FLAC__metadata_object_cuesheet_insert_track,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32,Ptr{FLAC__StreamMetadata_CueSheet_Track},FLAC__bool),object,track_num,track,copy)
end

function FLAC__metadata_object_cuesheet_insert_blank_track(object::Ptr{FLAC__StreamMetadata},track_num::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_insert_blank_track,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,track_num)
end

function FLAC__metadata_object_cuesheet_delete_track(object::Ptr{FLAC__StreamMetadata},track_num::UInt32)
    ccall((:FLAC__metadata_object_cuesheet_delete_track,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},UInt32),object,track_num)
end

function FLAC__metadata_object_cuesheet_is_legal(object::Ptr{FLAC__StreamMetadata},check_cd_da_subset::FLAC__bool,violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__metadata_object_cuesheet_is_legal,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},FLAC__bool,Ptr{Ptr{UInt8}}),object,check_cd_da_subset,violation)
end

function FLAC__metadata_object_cuesheet_calculate_cddb_id(object::Ptr{FLAC__StreamMetadata})
    ccall((:FLAC__metadata_object_cuesheet_calculate_cddb_id,metadata),FLAC__UInt32,(Ptr{FLAC__StreamMetadata},),object)
end

function FLAC__metadata_object_picture_set_mime_type(object::Ptr{FLAC__StreamMetadata},mime_type::Ptr{UInt8},copy::FLAC__bool)
    ccall((:FLAC__metadata_object_picture_set_mime_type,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{UInt8},FLAC__bool),object,mime_type,copy)
end

function FLAC__metadata_object_picture_set_description(object::Ptr{FLAC__StreamMetadata},description::Ptr{FLAC__byte},copy::FLAC__bool)
    ccall((:FLAC__metadata_object_picture_set_description,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{FLAC__byte},FLAC__bool),object,description,copy)
end

function FLAC__metadata_object_picture_set_data(object::Ptr{FLAC__StreamMetadata},data::Ptr{FLAC__byte},length::FLAC__UInt32,copy::FLAC__bool)
    ccall((:FLAC__metadata_object_picture_set_data,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{FLAC__byte},FLAC__UInt32,FLAC__bool),object,data,length,copy)
end

function FLAC__metadata_object_picture_is_legal(object::Ptr{FLAC__StreamMetadata},violation::Ptr{Ptr{UInt8}})
    ccall((:FLAC__metadata_object_picture_is_legal,metadata),FLAC__bool,(Ptr{FLAC__StreamMetadata},Ptr{Ptr{UInt8}}),object,violation)
end

function FLAC__stream_decoder_new()
    ccall((:FLAC__stream_decoder_new,libFLAC),Ptr{FLAC__StreamDecoder},())
end

function FLAC__stream_decoder_delete(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_delete,libFLAC),Void,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_ogg_serial_number(decoder::Ptr{FLAC__StreamDecoder},serial_number::Clong)
    ccall((:FLAC__stream_decoder_set_ogg_serial_number,libFLAC)
          ,FLAC__bool,(Ptr{FLAC__StreamDecoder},Clong),decoder,serial_number)
end

function FLAC__stream_decoder_set_md5_checking(decoder::Ptr{FLAC__StreamDecoder},value::FLAC__bool)
    ccall((:FLAC__stream_decoder_set_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__bool),decoder,value)
end

function FLAC__stream_decoder_set_metadata_respond(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_respond,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_respond_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_respond_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_respond_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_respond_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_set_metadata_ignore(decoder::Ptr{FLAC__StreamDecoder},_type::FLAC__MetadataType)
    ccall((:FLAC__stream_decoder_set_metadata_ignore,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__MetadataType),decoder,_type)
end

function FLAC__stream_decoder_set_metadata_ignore_application(decoder::Ptr{FLAC__StreamDecoder},id::Array_4_FLAC__byte)
    ccall((:FLAC__stream_decoder_set_metadata_ignore_application,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Array_4_FLAC__byte),decoder,id)
end

function FLAC__stream_decoder_set_metadata_ignore_all(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_set_metadata_ignore_all,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_state(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_state,libFLAC),FLAC__StreamDecoderState,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_resolved_state_string(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_resolved_state_string,libFLAC),Ptr{UInt8},(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_md5_checking(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_md5_checking,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_total_samples(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_total_samples,libFLAC),FLAC__uint64,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channels(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channels,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_channel_assignment(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_channel_assignment,libFLAC),FLAC__ChannelAssignment,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_bits_per_sample(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_bits_per_sample,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_sample_rate(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_sample_rate,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_blocksize(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_get_blocksize,libFLAC),UInt32,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_get_decode_position(decoder::Ptr{FLAC__StreamDecoder},position::Ptr{FLAC__uint64})
    ccall((:FLAC__stream_decoder_get_decode_position,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},Ptr{FLAC__uint64}),decoder,position)
end

function FLAC__stream_decoder_init_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_stream(decoder::Ptr{FLAC__StreamDecoder},read_callback::FLAC__StreamDecoderReadCallback,seek_callback::FLAC__StreamDecoderSeekCallback,tell_callback::FLAC__StreamDecoderTellCallback,length_callback::FLAC__StreamDecoderLengthCallback,eof_callback::FLAC__StreamDecoderEofCallback,write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_stream,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},FLAC__StreamDecoderReadCallback,FLAC__StreamDecoderSeekCallback,FLAC__StreamDecoderTellCallback,FLAC__StreamDecoderLengthCallback,FLAC__StreamDecoderEofCallback,FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,read_callback,seek_callback,tell_callback,length_callback,eof_callback,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_FILE(decoder::Ptr{FLAC__StreamDecoder},file::Ptr{FILE},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_FILE,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{FILE},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,file,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_init_ogg_file(decoder::Ptr{FLAC__StreamDecoder},filename::Ptr{UInt8},write_callback::FLAC__StreamDecoderWriteCallback,metadata_callback::FLAC__StreamDecoderMetadataCallback,error_callback::FLAC__StreamDecoderErrorCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_decoder_init_ogg_file,libFLAC),FLAC__StreamDecoderInitStatus,(Ptr{FLAC__StreamDecoder},Ptr{UInt8},FLAC__StreamDecoderWriteCallback,FLAC__StreamDecoderMetadataCallback,FLAC__StreamDecoderErrorCallback,Ptr{Void}),decoder,filename,write_callback,metadata_callback,error_callback,client_data)
end

function FLAC__stream_decoder_finish(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_finish,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_flush(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_flush,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_reset(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_reset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_single(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_single,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_metadata(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_metadata,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_process_until_end_of_stream(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_process_until_end_of_stream,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_skip_single_frame(decoder::Ptr{FLAC__StreamDecoder})
    ccall((:FLAC__stream_decoder_skip_single_frame,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},),decoder)
end

function FLAC__stream_decoder_seek_absolute(decoder::Ptr{FLAC__StreamDecoder},sample::FLAC__uint64)
    ccall((:FLAC__stream_decoder_seek_absolute,libFLAC),FLAC__bool,(Ptr{FLAC__StreamDecoder},FLAC__uint64),decoder,sample)
end

function FLAC__stream_encoder_new()
    ccall((:FLAC__stream_encoder_new,libFLAC),Ptr{FLAC__StreamEncoder},())
end

function FLAC__stream_encoder_delete(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_delete,libFLAC),Void,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_set_ogg_serial_number(encoder::Ptr{FLAC__StreamEncoder},serial_number::Clong)
    ccall((:FLAC__stream_encoder_set_ogg_serial_number,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Clong),encoder,serial_number)
end

function FLAC__stream_encoder_set_verify(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_verify,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_streamable_subset(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_streamable_subset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_channels(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_channels,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_bits_per_sample(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_bits_per_sample,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_sample_rate(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_sample_rate,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_compression_level(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_compression_level,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_blocksize(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_blocksize,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_do_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_loose_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_loose_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_apodization(encoder::Ptr{FLAC__StreamEncoder},specification::Ptr{UInt8})
    ccall((:FLAC__stream_encoder_set_apodization,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{UInt8}),encoder,specification)
end

function FLAC__stream_encoder_set_max_lpc_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_max_lpc_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_qlp_coeff_precision(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_qlp_coeff_precision,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_do_qlp_coeff_prec_search(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_qlp_coeff_prec_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_do_escape_coding(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_escape_coding,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_do_exhaustive_model_search(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__bool)
    ccall((:FLAC__stream_encoder_set_do_exhaustive_model_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__bool),encoder,value)
end

function FLAC__stream_encoder_set_min_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_min_residual_partition_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_max_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_max_residual_partition_order,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_rice_parameter_search_dist(encoder::Ptr{FLAC__StreamEncoder},value::UInt32)
    ccall((:FLAC__stream_encoder_set_rice_parameter_search_dist,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},UInt32),encoder,value)
end

function FLAC__stream_encoder_set_total_samples_estimate(encoder::Ptr{FLAC__StreamEncoder},value::FLAC__uint64)
    ccall((:FLAC__stream_encoder_set_total_samples_estimate,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},FLAC__uint64),encoder,value)
end

function FLAC__stream_encoder_set_metadata(encoder::Ptr{FLAC__StreamEncoder},metadata::Ptr{Ptr{FLAC__StreamMetadata}},num_blocks::UInt32)
    ccall((:FLAC__stream_encoder_set_metadata,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{Ptr{FLAC__StreamMetadata}},UInt32),encoder,metadata,num_blocks)
end

function FLAC__stream_encoder_get_state(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_state,libFLAC),FLAC__StreamEncoderState,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_verify_decoder_state(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_verify_decoder_state,libFLAC),FLAC__StreamDecoderState,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_resolved_state_string(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_resolved_state_string,libFLAC),Ptr{UInt8},(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_verify_decoder_error_stats(encoder::Ptr{FLAC__StreamEncoder},absolute_sample::Ptr{FLAC__uint64},frame_number::Ptr{UInt32},channel::Ptr{UInt32},sample::Ptr{UInt32},expected::Ptr{FLAC__int32},got::Ptr{FLAC__int32})
    ccall((:FLAC__stream_encoder_get_verify_decoder_error_stats,libFLAC),Void,(Ptr{FLAC__StreamEncoder},Ptr{FLAC__uint64},Ptr{UInt32},Ptr{UInt32},Ptr{UInt32},Ptr{FLAC__int32},Ptr{FLAC__int32}),encoder,absolute_sample,frame_number,channel,sample,expected,got)
end

function FLAC__stream_encoder_get_verify(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_verify,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_streamable_subset(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_streamable_subset,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_channels(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_channels,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_bits_per_sample(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_bits_per_sample,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_sample_rate(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_sample_rate,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_blocksize(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_blocksize,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_loose_mid_side_stereo(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_loose_mid_side_stereo,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_max_lpc_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_max_lpc_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_qlp_coeff_precision(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_qlp_coeff_precision,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_qlp_coeff_prec_search(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_qlp_coeff_prec_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_escape_coding(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_escape_coding,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_do_exhaustive_model_search(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_do_exhaustive_model_search,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_min_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_min_residual_partition_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_max_residual_partition_order(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_max_residual_partition_order,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_rice_parameter_search_dist(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_rice_parameter_search_dist,libFLAC),UInt32,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_get_total_samples_estimate(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_get_total_samples_estimate,libFLAC),FLAC__uint64,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_init_stream(encoder::Ptr{FLAC__StreamEncoder},write_callback::FLAC__StreamEncoderWriteCallback,seek_callback::FLAC__StreamEncoderSeekCallback,tell_callback::FLAC__StreamEncoderTellCallback,metadata_callback::FLAC__StreamEncoderMetadataCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_stream,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},FLAC__StreamEncoderWriteCallback,FLAC__StreamEncoderSeekCallback,FLAC__StreamEncoderTellCallback,FLAC__StreamEncoderMetadataCallback,Ptr{Void}),encoder,write_callback,seek_callback,tell_callback,metadata_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_stream(encoder::Ptr{FLAC__StreamEncoder},read_callback::FLAC__StreamEncoderReadCallback,write_callback::FLAC__StreamEncoderWriteCallback,seek_callback::FLAC__StreamEncoderSeekCallback,tell_callback::FLAC__StreamEncoderTellCallback,metadata_callback::FLAC__StreamEncoderMetadataCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_stream,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},FLAC__StreamEncoderReadCallback,FLAC__StreamEncoderWriteCallback,FLAC__StreamEncoderSeekCallback,FLAC__StreamEncoderTellCallback,FLAC__StreamEncoderMetadataCallback,Ptr{Void}),encoder,read_callback,write_callback,seek_callback,tell_callback,metadata_callback,client_data)
end

function FLAC__stream_encoder_init_FILE(encoder::Ptr{FLAC__StreamEncoder},file::Ptr{FILE},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_FILE,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{FILE},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,file,progress_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_FILE(encoder::Ptr{FLAC__StreamEncoder},file::Ptr{FILE},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_FILE,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{FILE},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,file,progress_callback,client_data)
end

function FLAC__stream_encoder_init_file(encoder::Ptr{FLAC__StreamEncoder},filename::Ptr{UInt8},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_file,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{UInt8},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,filename,progress_callback,client_data)
end

function FLAC__stream_encoder_init_ogg_file(encoder::Ptr{FLAC__StreamEncoder},filename::Ptr{UInt8},progress_callback::FLAC__StreamEncoderProgressCallback,client_data::Ptr{Void})
    ccall((:FLAC__stream_encoder_init_ogg_file,libFLAC),FLAC__StreamEncoderInitStatus,(Ptr{FLAC__StreamEncoder},Ptr{UInt8},FLAC__StreamEncoderProgressCallback,Ptr{Void}),encoder,filename,progress_callback,client_data)
end

function FLAC__stream_encoder_finish(encoder::Ptr{FLAC__StreamEncoder})
    ccall((:FLAC__stream_encoder_finish,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},),encoder)
end

function FLAC__stream_encoder_process(encoder::Ptr{FLAC__StreamEncoder},buffer::Ptr{Ptr{FLAC__int32}},samples::UInt32)
    ccall((:FLAC__stream_encoder_process,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{Ptr{FLAC__int32}},UInt32),encoder,buffer,samples)
end

function FLAC__stream_encoder_process_interleaved(encoder::Ptr{FLAC__StreamEncoder},buffer::Ptr{FLAC__int32},samples::UInt32)
    ccall((:FLAC__stream_encoder_process_interleaved,libFLAC),FLAC__bool,(Ptr{FLAC__StreamEncoder},Ptr{FLAC__int32},UInt32),encoder,buffer,samples)
end
