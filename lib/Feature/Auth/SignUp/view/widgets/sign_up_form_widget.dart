import 'package:desktop_app/Feature/Auth/SignUp/data/models/get_device_udid.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/sign_up_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignUp/view/widgets/already_have_an_accunt_sign_in.dart';
import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/align_left_text.dart';
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
    getDeviceUDID().then((value) {
      if (!mounted) return;
      SignUpCubit signUpCubit = context.read<SignUpCubit>();
      signUpCubit.deviceidIDController.text = value;
      signUpCubit.udIDController.text = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            verticalSpace(30),
            Text(
              'Sign Up',
              style: AppTextStyle.fontWeightw500Size16Colorblack(),
            ),
            verticalSpace(10),
            AlignLeftText(text: 'First Name'),
            CustomTextFormField(
              hintText: 'first name',
              controller: signUpCubit.firstNameController,
              prefixIcon: Icons.person,
              color: Colors.grey,
            ),

            AlignLeftText(text: 'Last Name'),
            CustomTextFormField(
              hintText: 'last name',
              controller: signUpCubit.lastNameController,
              prefixIcon: Icons.person,
              color: Colors.grey,
            ),
            AlignLeftText(text: 'Email'),
            CustomTextFormField(
              hintText: 'Email',
              controller: signUpCubit.emailController,
              prefixIcon: Icons.email_outlined,
              color: Colors.grey,
            ),
            AlignLeftText(text: 'Password'),
            CustomTextFormField(
              obscureText: obscure,
              hintText: 'password',
              controller: signUpCubit.passwordController,
              prefixIcon: Icons.lock_outlined,
              suffixIcon: IconButton(
                onPressed: () {
                  obsecureState();
                },
                icon: Icon(checkIconPassword()),
              ),
            ),
            AlignLeftText(text: 'Deviceid ID'),
            CustomTextFormField(
              controller: signUpCubit.deviceidIDController,
              // readOnly: true,
              prefixIcon: Icons.perm_device_information,
            ),
            AlignLeftText(text: 'UDID'),
            CustomTextFormField(
              controller: signUpCubit.udIDController,
              // readOnly: true,
              prefixIcon: Icons.vpn_key,
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
