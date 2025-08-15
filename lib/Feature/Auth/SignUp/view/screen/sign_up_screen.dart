import 'package:desktop_app/Feature/Auth/SignUp/data/repos/sign_up_repo.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/sign_up_cubit.dart';
import 'package:desktop_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<SignUpRepo>()),
      child: Scaffold(body: SingleChildScrollView(child: SignUpFormWidget())),
    );
  }
}
