import 'package:dio/dio.dart';
import 'package:kafill/features/login/data/models/login_request_body.dart';
import 'package:kafill/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

import 'api_const.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
