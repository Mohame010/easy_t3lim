
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_error_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_response_model.dart';
import 'package:desktop_app/core/network/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'signup_result.freezed.dart';

@freezed
class SignupResult with _$SignupResult {
  const factory SignupResult.success({required SignupSucessfullyResponseModel userModel}) =
     SignupSuccess;
     
  const factory SignupResult.error({
    required SignupErrorResponseModel errorModel,
  }) =SignupError;
  const factory SignupResult.serverError({
    required ApiErrorModel errorModel,
  }) =SignupServerError;
}
