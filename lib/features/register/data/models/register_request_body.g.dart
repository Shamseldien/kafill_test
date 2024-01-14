// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      fName: json['first_name'] as String,
      lName: json['last_name'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as int).toList(),
      socialMedia: (json['favorite_social_media'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      salary: json['salary'] as int,
      type: json['type'] as int,
      birthDate: json['birth_date'] as String,
      gender: json['gender'] as bool,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
        RegisterRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.fName,
      'last_name': instance.lName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'tags': instance.tags,
      'favorite_social_media': instance.socialMedia,
      'salary': instance.salary,
      'type': instance.type,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
    };
