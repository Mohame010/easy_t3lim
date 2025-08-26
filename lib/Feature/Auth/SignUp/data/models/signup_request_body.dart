import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String password;
  @JsonKey(name: 'deviceid')
  final String deviceidID;

  final String udid;
  SignupRequestBody({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.deviceidID,
    required this.udid,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
