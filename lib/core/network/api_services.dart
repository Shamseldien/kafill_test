import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kafill/features/login/data/models/login_request_body.dart';
import 'package:kafill/features/login/data/models/login_response.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:retrofit/retrofit.dart';
import 'api_const.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  /// Get dependencies method
  @GET(ApiConstants.dependencies)
  Future<DependenciesModel> getDependencies();

  /// Register method
  @POST(ApiConstants.register)
  Future<dynamic> register(
      @Body() FormData formData,
      );


  /// Login method
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );

  /// Get Who Am I method
  @GET(ApiConstants.whoAmI)
  Future<dynamic> getWhoAmI(
      @Header('Authorization') String authorization,
      );
}
