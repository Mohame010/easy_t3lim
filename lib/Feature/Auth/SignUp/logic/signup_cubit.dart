import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/signup_result.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/repos/sign_up_repo.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_state.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/helper/constans.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  SignupCubit(this._signUpRepo) : super(SignupState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String deviceId = '';

  final signUpFormKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    if (signUpFormKey.currentState!.validate()) {
      emit(SignupState.loading());
      final uuid = Uuid();

      String udid = uuid.v4();

      log(deviceId);
      final response = await _signUpRepo.singup(
        userRequest: SignupRequestBody(
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordController.text,
          deviceidID: deviceId,
          udid: udid,
        ),
      );

      response.when(
        success: (userModel) async {
          await saveToken(userModel.token);
          emit(SignupState.success());
        },
        error: (error) {
          emit(SignupState.error(error: error.message));
        },
        serverError: (serverError) {
          emit(SignupState.error(error: serverError.message));
        },
      );
    }
  }
}

Future<void> saveToken(String token) async {
  await CacheHelper.setSecuredString(ShardPrefKeys.userToken, token);
}
