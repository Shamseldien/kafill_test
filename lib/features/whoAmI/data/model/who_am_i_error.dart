import 'package:json_annotation/json_annotation.dart';

part 'who_am_i_error.g.dart';

@JsonSerializable()
class WhoAmIError {
  final int status;
  final bool success;
  final ErrorDetails error;

  WhoAmIError({
    required this.status,
    required this.success,
    required this.error,
  });

  factory WhoAmIError.fromJson(Map<String, dynamic> json) =>
      _$WhoAmIErrorFromJson(json);

  Map<String, dynamic> toJson() => _$WhoAmIErrorToJson(this);
}

@JsonSerializable()
class ErrorDetails {
  final int code;
  final String message;

  ErrorDetails({
    required this.code,
    required this.message,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsToJson(this);
}
