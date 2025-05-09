import 'package:bouselwawa/Features/login/data/models/login_request.dart';
import 'package:bouselwawa/Features/login/data/models/login_response.dart';
import 'package:bouselwawa/Features/register/data/models/sign_up_request_body.dart';
import 'package:bouselwawa/Features/register/data/models/sign_up_response.dart';
import 'package:bouselwawa/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

/// part file for ApiService class aoutomatic generated by retrofit package

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// factory constructor for ApiService make the api service singleton depend on dio object

  @POST(ApiConstants.login)

  /// login api endpoint

  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  /// login api request body
  @POST(ApiConstants.signUp)
  Future<SignupResponse> signUp(@Body()SignupRequestBody loginRequestBody);
}
