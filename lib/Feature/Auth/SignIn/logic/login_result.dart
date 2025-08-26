import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_failure_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/core/network/api_error_handler.dart';
import 'package:desktop_app/core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_result.freezed.dart';

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult.success({required LoginResponseModel userModel}) =
      LoginSuccess;

  const factory LoginResult.error({
    required LoginFailureResponseModel errorModel,
  }) = LoginError;
  const factory LoginResult.serverError({
    required ApiErrorModel errorModel,
  }) = LoginServerError;
}
