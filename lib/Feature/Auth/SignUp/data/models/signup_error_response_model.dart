import 'package:json_annotation/json_annotation.dart';

part 'signup_error_response_model.g.dart';

@JsonSerializable()
class SignupErrorResponseModel {
  final int status;
  final bool validity;
  final String message;
  @JsonKey(name: 'email_verification')
  final String emailVerification;

  SignupErrorResponseModel({
    required this.status,
    required this.validity,
    required this.message,
    required this.emailVerification,
  });

  factory SignupErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupErrorResponseModelToJson(this);
}
