import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kafill/core/network/api_services.dart';
 import 'package:kafill/features/register/data/models/register_request_body.dart';
import 'package:kafill/features/register/data/models/register_request_error.dart';
import 'package:kafill/features/register/data/models/register_response.dart';

import '../../../../core/network/api_res.dart';

class RegisterRepo {
  final ApiServices _apiService;

  RegisterRepo(this._apiService);

    Future<dynamic> registerUser(FormData formData ,   ) async {

      try {
        final response = await _apiService.register(formData,);
          return ApiResults.success(response);
      } catch (error) {
         if(error is DioException){
          Map<String, dynamic> data = error.response!.data;
           return ApiResults.failure(RegisterRequestError.fromJson(data));
        }else{
          return ApiResults.failure(error.toString());
        }

      }
    }




}
