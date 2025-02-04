import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';
//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class ApiErrorModel {
  int? code;
  String? message;

  ApiErrorModel({this.code, this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
