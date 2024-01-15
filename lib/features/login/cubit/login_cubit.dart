import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/core/helpers/caching_helper.dart';
import 'package:kafill/features/login/cubit/login_state.dart';
import 'package:kafill/features/login/data/models/login_request_body.dart';
import 'package:kafill/features/login/data/models/login_request_error.dart';
import 'package:kafill/features/login/data/models/login_response.dart';
import 'package:kafill/features/login/data/repositories/login_repo.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo,  ) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginResponse? loginResponseBody  ;
  bool isRememberMeValue = false;
  final CacheManager _cacheManager = getIt<CacheManager>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse)async {
      loginResponseBody = loginResponse;
      _saveToken(loginResponse.accessToken);
      emit(LoginSuccess(loginResponse));
    }, failure: (error) {
      emit(LoginError(error));
    });
  }


  void _saveToken(String token) async {
    if(isRememberMeValue) {
      await _cacheManager.cacheData("token", loginResponseBody!.accessToken);
    }
  }




}
