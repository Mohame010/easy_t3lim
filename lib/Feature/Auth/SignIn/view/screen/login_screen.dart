import 'package:desktop_app/Feature/Auth/SignIn/data/repos/login_repo.dart';
import 'package:desktop_app/Feature/Auth/SignIn/logic/login_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignIn/view/widgets/login_form_widget.dart';
import 'package:desktop_app/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginRepo>()),
      child: Scaffold(body: LoginFormWidget()),
    );
  }
}
