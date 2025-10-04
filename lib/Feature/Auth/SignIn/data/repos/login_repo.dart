import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_failure_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_result.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/api_error_handler.dart';
import 'package:desktop_app/core/service/token_service.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final Dio dio;
  LoginRepo(this.dio);

  Future<LoginResult> login({required LoginRequestBody userModel}) async {
    try {
      var response = await dio.request(
        '${ApiConstans.baseUrl}${ApiConstans.login}',
        options: Options(method: 'POST'),
        data: FormData.fromMap(userModel.toJson()),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final int validity = data['validity'];

        switch (validity) {
          case 0:
            return LoginResult.error(
              errorModel: LoginFailureResponseModel.fromJson(response.data),
            );

          case 1:
            return LoginResult.success(
              userModel: LoginResponseModel.fromJson(response.data),
            );

          default:
            return LoginResult.serverError(
              errorModel: ApiErrorHandler.handle(response),
            );
        }
      } else {
        return LoginResult.serverError(
          errorModel: ApiErrorHandler.handle(response),
        );
      }
    } on DioException catch (e) {
      return LoginResult.serverError(errorModel: ApiErrorHandler.handle(e));
    } catch (e) {
      return LoginResult.serverError(
        errorModel: ApiErrorHandler.handle(e.toString()),
      );
    }
  }
}
