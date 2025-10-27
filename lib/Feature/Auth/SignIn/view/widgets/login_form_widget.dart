import 'package:desktop_app/Feature/Auth/SignIn/logic/login_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/dont_have_an_account_signup.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/service/windows_kayboard_blocker.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/utils/validation/app_validation.dart';
import 'package:desktop_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_widget.dart';
import 'login_button_state_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(100),

            IconButton(
              onPressed: () async {
                await KeyboardBlocker.stop();
              },
              icon: Icon(Icons.exit_to_app),
            ),
            Text('Log In', style: AppTextStyle.fontWeightw500Size16Colorblack),
            verticalSpace(50),
            CustomTextFormField(
              icon: Icon(Icons.email_outlined),
              hintText: 'Email',
              controller: context.read<LoginCubit>().emailController,
              validator: AppValidation.emailValidation,
            ),
            verticalSpace(10),
            CustomTextFormField(
              icon: Icon(Icons.lock_outline_sharp),

              isObscureText: true,
              hintText: 'password',
              controller: context.read<LoginCubit>().passwordController,
              validator: AppValidation.passwordValidation,
            ),
            ForgetPasswordWidget(),
            LoginButtonStateWidget(logInCubit: cubit),
            verticalSpace(40),
            DontHaveAnAccountSignUp(),
          ],
        ),
      ),
    );
  }
}
