// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupErrorResponseModel _$SignupErrorResponseModelFromJson(
  Map<String, dynamic> json,
) => SignupErrorResponseModel(
  status: (json['status'] as num).toInt(),
  validity: json['validity'] as bool,
  message: json['message'] as String,
  emailVerification: json['email_verification'] as String,
);

Map<String, dynamic> _$SignupErrorResponseModelToJson(
  SignupErrorResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'validity': instance.validity,
  'message': instance.message,
  'email_verification': instance.emailVerification,
};
