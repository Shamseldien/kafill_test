import 'package:json_annotation/json_annotation.dart';

part 'register_request_error.g.dart';

@JsonSerializable()
class RegisterRequestError {
  final String message;
  final Map<String, List<String>> errors;

  RegisterRequestError({
    required this.message,
    required this.errors,
  });

  factory RegisterRequestError.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestErrorFromJson(json);

 }