import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_cubit.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/service/service_locator.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:desktop_app/core/utils/resource/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../SignUp/view/screen/signup_screen.dart';

class DontHaveAnAccountSignUp extends StatelessWidget {
  const DontHaveAnAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        children: [
          TextSpan(
            text: "Sign Up",
            style: AppTextStyle.fontWeightBoldFontSize14Greay.copyWith(
              color: AppColors.blueColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => getIt<SignupCubit>(),
                    child: SignupScreen(),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
