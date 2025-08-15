import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String password;
  @JsonKey(name: 'deviceid')
  final String deviceidID;
  final String udid;
  SignUpRequestBody({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.deviceidID,
    required this.udid,
  });

  // factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
  //     _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
  // FormData toFormData() {
  //   return FormData.fromMap({
  //     'email': email,
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'password': password,
  //     'deviceid': deviceidID,
  //     'udid': udid,
  //   });
  // }
}
