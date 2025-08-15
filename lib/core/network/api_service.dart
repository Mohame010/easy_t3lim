import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/sign_up_response_model.dart';
import 'package:desktop_app/core/network/api_constans.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstans.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstans.login)
  Future<LoginResponseModel> login(
    @Query('email') String email,
    @Query('password') String password,
  );

  @GET(ApiConstans.home)
  Future<LoginResponseModel> home(@Query('auth_token') String authToken);

  @POST(ApiConstans.signUp)
  @MultiPart()
  Future<SignUpResponseModel> signUp(
    @Part(name: 'email') String email,
    @Part(name: 'first_name') String firstName, 
    @Part(name: 'last_name') String lastName,
    @Part(name: 'password') String password,
    @Part(name: 'deviceid') String deviceId,
    @Part(name: 'udid') String udid,
  );
}
