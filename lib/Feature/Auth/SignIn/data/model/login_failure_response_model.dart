import 'package:json_annotation/json_annotation.dart';

part 'login_failure_response_model.g.dart';

@JsonSerializable()
class LoginFailureResponseModel {
  final int validity;
  @JsonKey(name: 'device_verification')
  final String deviceVerification;
  LoginFailureResponseModel({
    required this.validity,
    required this.deviceVerification,
  });

  factory LoginFailureResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginFailureResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginFailureResponseModelToJson(this);
}
