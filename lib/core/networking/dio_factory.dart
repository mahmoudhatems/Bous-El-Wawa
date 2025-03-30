

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory  {
  /// private constructor as i want to make this class singleton, so no one can create object of this class
  DioFactory._();
  static Dio?dio;
  static Dio getDio()  {
    Duration timeout =const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!..options.connectTimeout=timeout..options.receiveTimeout=timeout;
      addDioInterceptor();
      return dio!;
    }else{
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      )
    );
  }


}