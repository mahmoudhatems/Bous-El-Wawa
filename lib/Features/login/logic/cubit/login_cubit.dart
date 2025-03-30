
import 'package:bouselwawa/Features/login/data/models/login_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bouselwawa/Features/login/data/repos/login_repo.dart';
import 'package:bouselwawa/Features/login/logic/cubit/login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();

  void emitloginState(LoginRequestBody loginRequestBody)async{
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse ) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error){
        emit(LoginState.error(error.apiErrorModel.message??''));
      }
    
    );
  }
}
