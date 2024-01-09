import 'package:dio/dio.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:retrofit/retrofit.dart';

import 'api_const.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.dependencies)
  Future<DependenciesModel> getDependencies();


}
