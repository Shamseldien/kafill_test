import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: 'first_name')
  final String fName;
  final String about;
  @JsonKey(name: 'last_name')
  final String lName;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String tags;
  @JsonKey(name: 'favorite_social_media')
  final String socialMedia;
  final int salary;
  final int type;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final bool gender;


  RegisterRequestBody(
      {required this.fName,
      required this.lName,
      required this.passwordConfirmation,
      required this.tags,
      required this.socialMedia,
      required this.salary,
      required this.type,
      required this.birthDate,
      required this.gender,
      required this.email,
      required this.about,
       required this.password});

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
