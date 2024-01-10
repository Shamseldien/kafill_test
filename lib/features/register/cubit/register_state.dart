part of 'register_cubit.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success([T? data]) = Success<T>;
  const factory RegisterState.error({required String error}) = Error;
  const factory RegisterState.checkFieldsState() = CheckFieldsState;
  const factory RegisterState.tabIndexUpdated({required int newTabIndex}) = TabIndexUpdated;
  const factory RegisterState.registerSkillsUpdated({required List<Tag> tags}) = RegisterSkillsUpdated;
}
