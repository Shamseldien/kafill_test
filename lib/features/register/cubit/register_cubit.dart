import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/data/repositories/register_repo.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());
  int activeStep=1;
  bool areFieldsEmpty = false;
  final registerValidationKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final PageController registerPageController = PageController(initialPage: 0);
   DependenciesModel? dependenciesModel;



  void changeActiveStep(int index){
    activeStep=index;
    emit(RegisterState.tabIndexUpdated(newTabIndex: index));
  }


  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void checkFieldsStatus() {
    if (activeStep == 1) {
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty){
        areFieldsEmpty = true;
        emit(const RegisterState.checkFieldsState());
      }else{
        areFieldsEmpty = false;
      }
    } else if ( activeStep == 2) {

    }



  }

  void getDependencies() async {
    emit(const RegisterState.loading());

    final response = await _registerRepo.getDependencies();
    response.when(success: (dependenciesResponse) {
      dependenciesModel=dependenciesResponse;
       emit(RegisterState.success(dependenciesResponse));
    }, failure: (error) {
      emit(RegisterState.error(error:error));
    },
    );
  }


}
