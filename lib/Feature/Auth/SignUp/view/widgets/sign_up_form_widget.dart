import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignUp/data/models/get_device_udid.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignUp/view/widgets/already_have_an_accunt_sign_in.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/utils/validation/app_validation.dart';
import 'package:desktop_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'signup_button_state.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  late bool obscure = true;
  void obsecureState() {
    setState(() {
      obscure = !obscure;
    });
  }

  IconData checkIconPassword() {
    return obscure == true ? Icons.visibility_off : Icons.visibility;
  }

  @override
  void initState() {
    getDeviceUDID().then((value) async {
      if (!mounted) return;
      context.read<SignupCubit>().deviceId = value
          .replaceAll("{", '')
          .replaceAll("}", '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignupCubit>();
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(30),
            Text('Sign Up', style: AppTextStyle.fontWeightw500Size16Colorblack),
            verticalSpace(10),
            CustomTextFormField(
              icon: Icon(Icons.person),

              hintText: 'First Name',
              controller: signUpCubit.firstNameController,

              validator: (name) {
                return null;
              },
            ),

            CustomTextFormField(
              icon: Icon(Icons.person),

              hintText: 'Last Name',
              controller: signUpCubit.lastNameController,
              validator: (name) {
                return null;
              },
            ),
            CustomTextFormField(
              icon: Icon(Icons.email_outlined),

              hintText: 'Email',
              controller: signUpCubit.emailController,
              validator: (email) => AppValidation.emailValidation(email),
            ),

            CustomTextFormField(
              icon: Icon(Icons.lock_outline_sharp),
              isObscureText: true,
              hintText: 'Password',
              controller: signUpCubit.passwordController,
              validator: AppValidation.passwordValidation,
            ),
            CustomTextFormField(
              icon: Icon(Icons.lock_outline_sharp),
              isObscureText: true,
              hintText: 'Confirm Password',
              controller: signUpCubit.confirmPasswordController,
              validator: (confirmPassword) =>
                  AppValidation.confirmPasswordValidation(
                    confirmPassword,
                    signUpCubit.passwordController.text,
                  ),
            ),
            verticalSpace(20),
            SignUpButtonState(),
            verticalSpace(20),
            AlreadyHaveAnAccuntSignInText(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
