import 'package:kafill/features/login/data/models/login_request_error.dart';
import 'package:kafill/features/login/data/models/login_response.dart';

abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
}
class LoginError extends LoginState {
  final LoginRequestError loginRequestError;
  LoginError(this.loginRequestError);
}
