import 'package:desktop_app/Feature/Auth/SignIn/logic/login_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/dont_have_an_account_signup.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/service/windows_kayboard_blocker.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/widgets/align_left_text.dart';
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
  Widget build(BuildContext context) {
    LoginCubit logInCubit = context.read<LoginCubit>();
    return Form(
      key: logInCubit.logInFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(100),

            IconButton(onPressed: () async{
              await KeyboardBlocker.stop();


            }, icon: Icon(Icons.exit_to_app),),
            Text(
              'Log In',
              style: AppTextStyle.fontWeightw500Size16Colorblack(),
            ),
            verticalSpace(50),
            AlignLeftText(text: 'Email'),
            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              controller: logInCubit.emailController,
            ),
            verticalSpace(10),
            AlignLeftText(text: 'Password'),
            CustomTextFormField(
              obscureText: obscure,
              hintText: 'password',
              controller: logInCubit.passwordController,
              prefixIcon: Icons.lock_outlined,
              suffixIcon: IconButton(
                onPressed: () {
                  obsecureState();
                },
                icon: Icon(checkIconPassword()),
              ),
            ),
            ForgetPasswordWidget(),
            LoginButtonStateWidget(logInCubit: logInCubit),
            verticalSpace(40),
            DontHaveAnAccountSignUp(),
          ],
        ),
      ),
    );
  }
}
