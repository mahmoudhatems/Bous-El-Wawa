
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()

class ApiErrorModel {
  
  int? code;
  String ?message;

  ApiErrorModel({this.code, this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['statusCode'],
      message: json['message'],
    );
  }
}