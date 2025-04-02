import 'package:bouselwawa/Features/login/data/repos/login_repo.dart';
import 'package:bouselwawa/Features/login/logic/cubit/login_cubit.dart';
import 'package:bouselwawa/Features/register/data/repos/sign_up_repo.dart';
import 'package:bouselwawa/Features/register/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:bouselwawa/core/networking/api_service.dart';
import 'package:bouselwawa/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit=GetIt.instance;

Future <void>setupGetIt() async{
  // DIO AND API SERVICE
    Dio dio =  DioFactory.getDio();  

    getit.registerLazySingleton <ApiService>(()=>ApiService(dio));
// LOGIN
  getit.registerFactory<LoginCubit>(()=>LoginCubit(getit()));
  getit.registerFactory<LoginRepo>(()=>LoginRepo( getit()));
  getit.registerLazySingleton<SignUpRepo>(()=>SignUpRepo(getit()));
  getit.registerFactory<SignupCubit>(()=>SignupCubit(getit()));
}