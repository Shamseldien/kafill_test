import 'package:dio/dio.dart';
import 'package:kafill/core/network/api_res.dart';
import 'package:kafill/core/network/api_services.dart';
import 'package:kafill/features/login/data/models/login_request_body.dart';
import 'package:kafill/features/login/data/models/login_request_error.dart';

class LoginRepo {
  final ApiServices _apiService;

  LoginRepo(this._apiService);

  Future<ApiResults<dynamic>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResults.success(response);
    } catch (error) {

      final _erroData = error as DioException;

          final LoginRequestError loginRequestError =
              LoginRequestError.fromJson(_erroData.response!.data,);

          return ApiResults.failure(loginRequestError);
      }



  }

}
