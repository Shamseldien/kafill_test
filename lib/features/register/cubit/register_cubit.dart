import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafill/features/register/cubit/register_state.dart';
 import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/data/models/register_request_body.dart';
import 'package:kafill/features/register/data/models/register_request_error.dart';
import 'package:kafill/features/register/data/repositories/register_repo.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(Initial());
  int activeStep=1;
  bool registerScreenFieldIsEmpty = false;
  bool completeRegisterFieldIsEmpty = false;
  int salary = 100;
  int? selectedGender ;
  List<Tag> selectedSkills = [];
  List<SocialMedia> selectedSocialMedia = [];
  String selectedDate =  DateFormat('yyyy-MM-dd').format(DateTime(2000));
  final ImagePicker picker = ImagePicker();
  XFile? profilePic;
  int? selectedUserType;

  final registerValidationKey = GlobalKey<FormState>();
  final completeRegisterValidationKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final PageController registerPageController = PageController(initialPage: 0);


  void changeActiveStep(int index){
    activeStep=index;
    emit(TabIndexUpdated(index));
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

  bool checkFieldsStatus() {
    print("selectedUserType");
    print(selectedUserType);

    if (activeStep == 1) {
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          selectedUserType==null||
          confirmPasswordController.text.isEmpty){
        registerScreenFieldIsEmpty = true;

      }else{
        registerScreenFieldIsEmpty = false;
        if(registerValidationKey.currentState!.validate()){
          registerPageController.jumpToPage(1);
          changeActiveStep(2);
        }

      }
    } else if ( activeStep == 2) {
      if(
      aboutController.text.isEmpty ||
      selectedSkills.isEmpty ||
          profilePic == null ||
      selectedSocialMedia.isEmpty
       ){
        registerScreenFieldIsEmpty = true;
       }else{
          registerScreenFieldIsEmpty = false;
          changeActiveStep(3);

      }
    }

    emit(CheckFieldsState());

    return registerScreenFieldIsEmpty;
  }


  void addTag(Tag tag) {
    if (!selectedSkills.contains(tag)) {
      selectedSkills.add(tag);
       emit(RegisterSkillsUpdated());
    }
  }

  void removeTag(Tag tag) {
    if (selectedSkills.contains(tag)) {
      selectedSkills.remove(tag);
      emit(RegisterSkillsUpdated());
    }
  }

  void showSkillsDialog(BuildContext context,widget) {
    showDialog(
        context: context,
        builder: (context)=>widget);
  }

  void increment() {
    if(salary<=1000) {
      salary ++;
    }
    emit(UpdateSalary());
  }

  void decrement() {
    if(salary>100) {
      salary --;
    }
    emit(UpdateSalary());
  }
  void changeSelectedSocialMedia(SocialMedia socialMedia) {

    if(!selectedSocialMedia.contains(socialMedia)){
        selectedSocialMedia.add(socialMedia);
    }else{
      selectedSocialMedia.remove(socialMedia);
    }

     emit(ChangeSelectedSocialMedia());
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:  DateTime(1990,01,01),
      firstDate: DateTime(1970),
      lastDate: DateTime(2023),
    );

    if (picked != null) {
         selectedDate = _formatDate(picked);
        emit(UpdateBirthDate());
    }
  }

  String _formatDate(DateTime date){
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void changeGender(int i) {
    selectedGender = i;
    emit(ChangeSelectedGender());
  }

  void handelBackButton() {
    if(activeStep == 1){
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      selectedUserType = null;
      // changeActiveStep(1);
    }else if(activeStep == 2 || activeStep == 3){
      registerPageController.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut);
      aboutController.clear();
      selectedSkills=[];
      selectedSocialMedia=[];
      selectedGender = null;
      profilePic=null;
      changeActiveStep(1);
    }else{
      disposeControllers();
    }

    emit(TabIndexUpdated(activeStep));
  }

  Future<void> pickProfilePic() async {
    try {
      profilePic = await picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      emit(ErrorState(error:e.toString()));
    }

    emit(ChangeProfilePic());
  }

  void changeSelectedValueIndex(int i) {
    selectedUserType = i;
    emit(ChangeSelectedValueIndex());
  }

  void registerUser()async{
    emit(LoadingState());

    List<String> _skillsList = selectedSkills.map((e) => e.value.toString()).toList();
    List<String> _socialMediaList = selectedSocialMedia.map((e) => e.value).toList();

    RegisterRequestBody registerRequestBody =RegisterRequestBody(
      fName: firstNameController.text,
      lName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
      tags: _skillsList,
      socialMedia: _socialMediaList,
      salary: salary,
      type: selectedUserType!,
      birthDate: selectedDate,
      about: aboutController.text,
      gender: selectedGender! ,
    );
    final file = await MultipartFile.fromFile(profilePic!.path);

    FormData formData = FormData.fromMap(registerRequestBody.toJson());
    formData.files.add(MapEntry('avatar',file));



    final response =   await _registerRepo.registerUser(formData, );
    response.when(
        success: (registerResponseBody) {
            emit(SuccessState(registerResponseBody));
     }, failure: ( error ) {


          if(error is RegisterRequestError){
            RegisterRequestError d = error;
            emit(ErrorState(registerRequestError: d ));

          }else{
            emit(ErrorState(error:error.toString()));
          }
    },

    );
  }

  void disposeControllers() {
    profilePic=null;
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
   selectedSkills=[];
     selectedSocialMedia=[];
     salary = 100;
     selectedUserType = null;
     selectedDate = DateFormat('yyyy-MM-dd').format(DateTime(2000));
     selectedDate = DateFormat('yyyy-MM-dd').format(DateTime(2000));
      aboutController.clear();
     selectedGender = null;
     activeStep=0;
  }



}
