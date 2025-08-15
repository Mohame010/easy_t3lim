import 'package:bloc/bloc.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/sign_up_request_body.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/models/sign_up_response_model.dart';
import 'package:desktop_app/Feature/Auth/SignUp/data/repos/sign_up_repo.dart';
import 'package:desktop_app/core/network/api_result.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/constans.dart';
import '../../../../core/helper/token_encryptor.dart';
import '../../../../core/helper/shared_pref.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitialState());
  final SignUpRepo signUpRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController deviceidIDController = TextEditingController();
  TextEditingController udIDController = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  void emitSignUpState() async {
    if (signUpFormKey.currentState != null &&
        signUpFormKey.currentState!.validate()) {
      emit(SignUpLoadingState());
      final response = await signUpRepo.signUp(
        SignUpRequestBody(
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: passwordController.text,
          deviceidID: deviceidIDController.text,
          udid: udIDController.text,
        ),
      );
      response.when(
        success: (response) async {
          await saveSignUpUserToken(response.token);
          emit(SignUpSuccessState(signUpResponseModel: response));
         },
        failure: (failur) => emit(SignUpFailureState(erroreMessag: failur)),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    udIDController.dispose();
    deviceidIDController.dispose();
    return super.close();
  }
}

Future<void> saveSignUpUserToken(String token) async {
  final encrypted = TokenEncryptor.encryptToken(token);
   await AppSharedPrefs.setString(ShardPrefKeys.userToken,encrypted );
}
