
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_failure_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_result.dart';
import 'package:desktop_app/core/network/api_constans.dart';
import 'package:desktop_app/core/network/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstans.baseUrl)
class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.request(
        '${ApiConstans.baseUrl}login?email=$email&password=$password',
        options: Options(method: 'GET'),
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
      // هنا هتهندل timeout, network error, unauthorized ... إلخ
      return LoginResult.serverError(errorModel: ApiErrorHandler.handle(e));
    } catch (e) {
      // أي exception تاني غير Dio
      return LoginResult.serverError(
        errorModel: ApiErrorHandler.handle(e.toString()),
      );
    }
  }
}

// abstract class ApiService {
//   factory ApiService(Dio dio) = _ApiService;

//   @GET(ApiConstans.home)
//   Future<LoginResponseModel> home(@Query('auth_token') String authToken);

//   @POST(ApiConstans.signUp)
//   @MultiPart()
//   Future<SignUpResponseModel> signUp(
//     @Part(name: 'email') String email,
//     @Part(name: 'first_name') String firstName,
//     @Part(name: 'last_name') String lastName,
//     @Part(name: 'password') String password,
//     @Part(name: 'deviceid') String deviceId,
//     @Part(name: 'udid') String udid,
//   );
// }
