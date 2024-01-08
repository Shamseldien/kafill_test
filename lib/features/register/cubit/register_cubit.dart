import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());
  int activeStep=0;
  void changeActiveStep(int index){
    activeStep=index;
    emit(RegisterState.tabIndexUpdated(newTabIndex: index));
  }
}
