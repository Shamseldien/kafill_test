import 'package:dio/dio.dart';
import 'package:kafill/core/network/api_res.dart';
import 'package:kafill/core/network/api_services.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';

class SplashRepo {
  final ApiServices _apiService;

  SplashRepo(this._apiService);

  Future<ApiResults<dynamic>> getDependencies() async {
    try {
      final response = await _apiService.getDependencies();
      return ApiResults.success(response);
    } catch (error) {
        return ApiResults.failure(error.toString());
    }
  }
}
