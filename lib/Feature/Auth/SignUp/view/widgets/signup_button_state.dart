import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_state.dart';
import 'package:desktop_app/core/function/show_snak_bar.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../Home/view/screen/home_screen.dart';

class SignUpButtonState extends StatelessWidget {
  const SignUpButtonState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            pushReplacement(context, HomeScreen());
          },

          error: (error) {
            showSnakBar(context, error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return CustomButton(
              onPressed: () {
                context.read<SignupCubit>().emitSignUpState();
              },
              title: Text(
                'Sign In',
                style: AppTextStyle.fontWeightw400Size18ColorWhite(),
              ),
            );
          },
          loading: () {
            return CustomLoadingIndicator();
          },
        );
      },
    );
  }
}
