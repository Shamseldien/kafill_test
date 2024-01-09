import 'package:kafill/core/network/api_services.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';

import '../../../../core/network/api_res.dart';

class RegisterRepo {
  final ApiServices _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResults<DependenciesModel>> getDependencies() async {
    try {
      final response = await _apiService.getDependencies();
      return ApiResults.success(response);
    } catch (error) {
      return ApiResults.failure(error.toString());
    }
  }
}
