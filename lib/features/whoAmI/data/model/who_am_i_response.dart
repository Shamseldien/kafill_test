import 'package:json_annotation/json_annotation.dart';

part 'who_am_i_response.g.dart';

@JsonSerializable()
class WhoAmIResponse {
  final int status;
  final bool success;
  final UserData data;

  WhoAmIResponse({
    required this.status,
    required this.success,
    required this.data,
  });

  factory WhoAmIResponse.fromJson(Map<String, dynamic> json) =>
      _$WhoAmIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WhoAmIResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String about;
  final List<Tag> tags;
  @JsonKey(name: 'favorite_social_media')
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final int gender;
  final UserType type;
  final String avatar;


  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class UserType {
  final int code;
  final String name;
  @JsonKey(name: 'nice_name')
  final String niceName;


  UserType({
    required this.code,
    required this.name,
    required this.niceName,
  });

  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}
