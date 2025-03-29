import 'package:bouselwawa/Features/login/data/models/login_request.dart';
import 'package:bouselwawa/Features/login/data/models/login_response.dart';
import 'package:bouselwawa/core/networking/api_error_handler.dart';
import 'package:bouselwawa/core/networking/api_result.dart';
import 'package:bouselwawa/core/networking/api_service.dart';
// making dependency injection for ApiService
class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService); 

  Future<ApiResult<LoginResponse>>login(LoginRequestBody loginRequestBody) async {
    try {
       final response = await _apiService.login(loginRequestBody);
       return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
    
  }

}

