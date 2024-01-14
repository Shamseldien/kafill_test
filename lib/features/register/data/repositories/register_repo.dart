import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kafill/core/network/api_services.dart';
 import 'package:kafill/features/register/data/models/register_request_body.dart';
import 'package:kafill/features/register/data/models/register_response.dart';

import '../../../../core/network/api_res.dart';

class RegisterRepo {
  final ApiServices _apiService;

  RegisterRepo(this._apiService);

    Future<ApiResults<RegisterResponseBody>> registerUser(FormData formData ,RegisterRequestBody registerRequestBody) async {

      try {
        final response = await _apiService.register(
          formData,
         registerRequestBody,);
        return ApiResults.success(response);
      } catch (error) {
        return ApiResults.failure(error.toString());
      }
    }




}
