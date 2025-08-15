import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../SignUp/view/screen/sign_up_screen.dart';

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
            recognizer: TapGestureRecognizer()
              ..onTap = () => pushReplacement(context, SignUpScreen()),
          ),
        ],
      ),
    );
  }
}
