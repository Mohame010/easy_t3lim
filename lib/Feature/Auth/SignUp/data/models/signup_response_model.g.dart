// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupSucessfullyResponseModel _$SignupSucessfullyResponseModelFromJson(
  Map<String, dynamic> json,
) => SignupSucessfullyResponseModel(
  validity: json['validity'] as bool,
  status: (json['status'] as num).toInt(),
  token: json['auth_token'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$SignupSucessfullyResponseModelToJson(
  SignupSucessfullyResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'validity': instance.validity,
  'auth_token': instance.token,
  'message': instance.message,
};
