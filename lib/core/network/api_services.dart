import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kafill/features/register/data/models/dependacies_model.dart';
import 'package:kafill/features/register/data/models/register_request_body.dart';
import 'package:kafill/features/register/data/models/register_request_error.dart';
import 'package:kafill/features/register/data/models/register_response.dart';
import 'package:retrofit/retrofit.dart';

import 'api_const.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.dependencies)
  Future<DependenciesModel> getDependencies();

  @POST(ApiConstants.register)
  Future<dynamic> register(
      @Body() FormData formData,
      );
}
