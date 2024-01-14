
import 'package:kafill/features/register/data/models/register_request_error.dart';

abstract class RegisterState {}

class Initial extends RegisterState {}

class LoadingState extends RegisterState {}
class RegisterUserLoadingState extends RegisterState {}

class SuccessState<T> extends RegisterState {
  final T? data;

  SuccessState(this.data);
}

class ErrorState extends RegisterState {
  dynamic error;
  final RegisterRequestError? registerRequestError;
  ErrorState({this.error,this.registerRequestError});
}

class CheckFieldsState extends RegisterState {}

class TabIndexUpdated extends RegisterState {
  final int newTabIndex;

  TabIndexUpdated(this.newTabIndex);
}

class UpdateSalary extends RegisterState {}

class RegisterSkillsUpdated extends RegisterState {}
class ChangeSelectedSocialMedia extends RegisterState {}
class UpdateBirthDate extends RegisterState {}
class ChangeSelectedGender extends RegisterState {}
class ChangeProfilePic extends RegisterState {}
class ChangeSelectedValueIndex extends RegisterState {}
