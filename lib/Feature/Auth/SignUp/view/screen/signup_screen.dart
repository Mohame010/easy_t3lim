import 'package:flutter/material.dart';
import '../widgets/sign_up_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: SignUpFormWidget()));
  }
}
