// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_failure_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginFailureResponseModel _$LoginFailureResponseModelFromJson(
  Map<String, dynamic> json,
) => LoginFailureResponseModel(
  validity: (json['validity'] as num).toInt(),
  deviceVerification: json['device_verification'] as String,
);

Map<String, dynamic> _$LoginFailureResponseModelToJson(
  LoginFailureResponseModel instance,
) => <String, dynamic>{
  'validity': instance.validity,
  'device_verification': instance.deviceVerification,
};
