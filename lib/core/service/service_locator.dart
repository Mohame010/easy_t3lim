import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/repos/sign_up_repo.dart';
import 'package:desktop_app/core/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  final dio = Dio();

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(apiService: getIt.get<ApiService>()),
  );
}
