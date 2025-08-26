import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_error_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_result.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/api_error_handler.dart';
import 'package:dio/dio.dart';

class SignUpRepo {
  final Dio dio;
  SignUpRepo(this.dio);

  Future<SignupResult> singup({required SignupRequestBody userRequest}) async {
    try {
      final response = await dio.request(
        "${ApiConstans.baseUrl}${ApiConstans.signUp}",
        options: Options(method: "POST"),
        data: FormData.fromMap(userRequest.toJson())

         
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        switch (data['validity']) {
          case true:
            return SignupResult.success(
              userModel: SignupSucessfullyResponseModel.fromJson(data),
            );
          case false:
            return SignupResult.error(
              errorModel: SignupErrorResponseModel.fromJson(data),
            );

          default:
            return SignupResult.serverError(
              errorModel: ApiErrorHandler.handle(response),
            );
        }
      } else {
        return SignupResult.serverError(
          errorModel: ApiErrorHandler.handle(response),
        );
      }
    } on DioException catch (e) {
      return SignupResult.serverError(errorModel: ApiErrorHandler.handle(e));
    } catch (e) {
      return SignupResult.serverError(
        errorModel: ApiErrorHandler.handle(e.toString()),
      );
    }
  }
}
