import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/repos/sign_up_repo.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_cubit.dart';
import 'package:desktop_app/core/network/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  // getIt.registerLazySingleton<SignUpRepo>(
  //   () => SignUpRepo(apiService: getIt.get<ApiService>()),
  // );
}
