import 'package:bloc/bloc.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/model/login_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_result.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_state.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/get_device_udid.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/dio_factory.dart';
import 'package:desktop_app/core/network/local_database/helper/hive_helper.dart';
import 'package:desktop_app/core/network/local_database/models/cached_user_model.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      final deviceId = await getDeviceUDID();
      final response = await _loginRepo.login(
        userModel: LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
          deviceid: deviceId.replaceAll("{", '').replaceAll("}", ''),
        ),
      );

      response.when(
        success: (userModel) async {
          await saveUserToken(userModel.token);

          await HiveHelper.saveUserData(
            userData: CachedUserModel(
              userId: userModel.userId,
              firstName: userModel.firstName,
              lastName: userModel.lastName,
              email: userModel.email,
            ),
          );
          emit(LoginState.success());
        },
        error: (error) {
          emit(LoginState.error(error: error.deviceVerification));
        },
        serverError: (error) {
          emit(LoginState.error(error: error.message));
        },
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await CacheHelper.setSecuredString(ShardPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
