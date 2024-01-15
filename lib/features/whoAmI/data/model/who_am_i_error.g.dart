// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'who_am_i_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhoAmIError _$WhoAmIErrorFromJson(Map<String, dynamic> json) => WhoAmIError(
      status: json['status'] as int,
      success: json['success'] as bool,
      error: ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WhoAmIErrorToJson(WhoAmIError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'error': instance.error,
    };

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) => ErrorDetails(
      code: json['code'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorDetailsToJson(ErrorDetails instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
