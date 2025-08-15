// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      validity: json['validity'] as bool,
      status: (json['status'] as num).toInt(),
      token: json['auth_token'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
  SignUpResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'validity': instance.validity,
  'auth_token': instance.token,
  'message': instance.message,
};
