// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependacies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DependenciesModel _$DependenciesModelFromJson(Map<String, dynamic> json) =>
    DependenciesModel(
      status: json['status'] as int,
      success: json['success'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DependenciesModelToJson(DependenciesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['social_media'] as List<dynamic>)
          .map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'types': instance.types,
      'tags': instance.tags,
      'social_media': instance.socialMedia,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      value: json['value'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      value: json['value'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) => SocialMedia(
      value: json['value'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$SocialMediaToJson(SocialMedia instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };
