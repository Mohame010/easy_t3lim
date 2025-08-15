import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final int status;
  final bool validity;
  @JsonKey(name: 'auth_token')
  final String token;
  final String message;

  SignUpResponseModel( {required this.validity, required this.status,required this.token, required this.message});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

