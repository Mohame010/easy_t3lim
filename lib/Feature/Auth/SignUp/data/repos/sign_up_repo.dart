import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignUp/data/models/sign_up_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/sign_up_response_model.dart';

import '../../../../../core/network/api_result.dart';
import '../../../../../core/network/api_service.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo({required this.apiService});
  Future<ApiResult<SignUpResponseModel>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await apiService.signUp(
        signUpRequestBody.email,
        signUpRequestBody.firstName,
        signUpRequestBody.lastName,
        signUpRequestBody.password,
        signUpRequestBody.deviceidID,
        signUpRequestBody.udid,
      );
      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(e.toString());
    }
  }
}
