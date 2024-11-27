import 'package:bouselwawa/core/networking/api_service.dart';
// making dependency injection for ApiService
class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

}