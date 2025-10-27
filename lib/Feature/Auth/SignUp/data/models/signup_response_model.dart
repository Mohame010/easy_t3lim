import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupSucessfullyResponseModel {
  final int status;
  final bool validity;
  @JsonKey(name: 'auth_token')
  final String token;
  final String message;

  SignupSucessfullyResponseModel({
    required this.validity,
    required this.status,
    required this.token,
    required this.message,
  });

  factory SignupSucessfullyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupSucessfullyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupSucessfullyResponseModelToJson(this);
}
