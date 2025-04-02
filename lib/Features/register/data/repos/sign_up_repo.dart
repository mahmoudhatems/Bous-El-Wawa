import 'package:bouselwawa/Features/register/data/models/sign_up_request_body.dart';
import 'package:bouselwawa/Features/register/data/models/sign_up_response.dart';
import 'package:bouselwawa/core/networking/api_error_handler.dart';
import 'package:bouselwawa/core/networking/api_result.dart';
import 'package:bouselwawa/core/networking/api_service.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
