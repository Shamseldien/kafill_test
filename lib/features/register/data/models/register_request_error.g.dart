// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestError _$RegisterRequestErrorFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestError(
      message: json['message'] as String,
      errors: (json['errors'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$RegisterRequestErrorToJson(
        RegisterRequestError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
    };
