import 'package:json_annotation/json_annotation.dart';

part 'dependacies_model.g.dart';

@JsonSerializable()
class DependenciesModel {
  final int status;
  final bool success;
  final Data data;

  DependenciesModel({
    required this.status,
    required this.success,
    required this.data,
  });

  factory DependenciesModel.fromJson(Map<String, dynamic> json) =>
      _$DependenciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DependenciesModelToJson(this);
}

@JsonSerializable()
class Data {
  final List<Type> types;
  final List<Tag> tags;
  @JsonKey(name:"social_media")
  final List<SocialMedia> socialMedia;

  Data({
    required this.types,
    required this.tags,
    required this.socialMedia,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Type {
  final int value;
  final String label;

  Type({
    required this.value,
    required this.label,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Tag {
  final int value;
  final String label;

  Tag({
    required this.value,
    required this.label,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class SocialMedia {
  final String value;
  final String label;

  SocialMedia({
    required this.value,
    required this.label,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaToJson(this);
}
