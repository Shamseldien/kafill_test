 import 'package:kafill/core/network/api_res.dart';
import 'package:kafill/core/network/api_services.dart';

class WhoAmIRepo {
  final ApiServices _apiService;

  WhoAmIRepo(this._apiService);

  Future<ApiResults<dynamic>> getWhoAmI(String? authorization) async {
    try {
      final response = await _apiService.getWhoAmI(authorization!);
      return ApiResults.success(response);
    } catch (error) {
      return ApiResults.failure(error.toString());
    }
  }
}
