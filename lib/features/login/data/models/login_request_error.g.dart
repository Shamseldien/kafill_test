// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestError _$LoginRequestErrorFromJson(Map<String, dynamic> json) =>
    LoginRequestError(
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$LoginRequestErrorToJson(LoginRequestError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
    };

DetailedErrorResponse _$DetailedErrorResponseFromJson(
        Map<String, dynamic> json) =>
    DetailedErrorResponse(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      error: json['error'] == null
          ? null
          : ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailedErrorResponseToJson(
        DetailedErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'error': instance.error,
    };

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) => ErrorDetails(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorDetailsToJson(ErrorDetails instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
