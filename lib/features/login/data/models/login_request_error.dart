import 'package:json_annotation/json_annotation.dart';

part 'login_request_error.g.dart';

@JsonSerializable()
class LoginRequestError {
  final String? message;
  final dynamic errors;

  LoginRequestError({this.message, this.errors});

  factory LoginRequestError.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('errors')) {
      return LoginRequestError(
        message: json['message'],
        errors: _parseNestedErrors(json['errors']),
      );
    } else {
      return LoginRequestError(
        message: json['error']['message'],
        errors: json['error'],
      );
    }
  }

  static Map<String, dynamic> _parseNestedErrors(Map<String, dynamic> errorsJson) {
    return errorsJson;
  }

  Map<String, dynamic> toJson() => _$LoginRequestErrorToJson(this);
}

@JsonSerializable()
class DetailedErrorResponse {
  final int? status;
  final bool? success;
  final ErrorDetails? error;

  DetailedErrorResponse({this.status, this.success, this.error});

  factory DetailedErrorResponse.fromJson(Map<String, dynamic> json) {
    return DetailedErrorResponse(
      status: json['status'],
      success: json['success'],
      error: json['error'] != null ? ErrorDetails.fromJson(json['error']) : null,
    );
  }

  Map<String, dynamic> toJson() => _$DetailedErrorResponseToJson(this);
}

@JsonSerializable()
class ErrorDetails {
  final String? code;
  final String? message;

  ErrorDetails({this.code, this.message});

  factory ErrorDetails.fromJson(Map<String, dynamic> json) => _$ErrorDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDetailsToJson(this);
}
