import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState  {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success([T? data]) = Success<T>;
  const factory RegisterState.error({required String error}) = ErrorState;
  const factory RegisterState.checkFieldsState() = CheckFieldsState;
  const factory RegisterState.tabIndexUpdated({required int newTabIndex}) = TabIndexUpdated;
  const factory RegisterState.updateSalary( ) = UpdateSalary;
  const factory RegisterState.registerSkillsUpdated({required List<Tag> tags}) = RegisterSkillsUpdated;
}
