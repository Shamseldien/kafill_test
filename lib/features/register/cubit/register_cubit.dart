import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
 import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/data/repositories/register_repo.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());
  int activeStep=1;
  bool areFieldsEmpty = false;
  double salary = 1000.0;
  final registerValidationKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final PageController registerPageController = PageController(initialPage: 0);
  DependenciesModel? dependenciesData;
  List<Tag> selectedSkills = [];


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
        emit( const RegisterState.checkFieldsState());
      }else{
        areFieldsEmpty = false;

        //activeStep = 2;
        registerPageController.jumpToPage(1);
        changeActiveStep(2);
      }
    } else if ( activeStep == 2) {
     // changeActiveStep(3);
      activeStep = 3;

    }
 
  }

  void getDependencies() async {
    emit(const RegisterState.loading());
    final response = await _registerRepo.getDependencies();
    response.when(success: (dependenciesResponse) {
      dependenciesData = dependenciesResponse;
       emit(RegisterState.success(dependenciesResponse));
    }, failure: (error) {
      emit(RegisterState.error(error:error));
    },
    );
  }

  void addSelectedSkill(Tag skill) {
    if (!selectedSkills.contains(skill))
      {
        selectedSkills.add(skill);
      }else{
      selectedSkills.remove(skill);
    }
      emit( RegisterState.registerSkillsUpdated(tags:selectedSkills));

  }

  void addTag(Tag tag) {
    if (!selectedSkills.contains(tag)) {
      selectedSkills.add(tag);

      print(selectedSkills);
    }
  }

  void removeTag(Tag tag) {
    if (selectedSkills.contains(tag)) {
      selectedSkills.remove(tag);
      emit(RegisterState.registerSkillsUpdated(tags: selectedSkills));
    }
  }

  void showSkillsDialog(BuildContext context,widget) {
    showDialog(
        context: context,
        builder: (context)=>widget);
  }

  void increment() {
    salary++;
    emit(const RegisterState.updateSalary( ));
  }

  void decrement() {
    salary --;
    emit(const RegisterState.updateSalary());
  }

}
