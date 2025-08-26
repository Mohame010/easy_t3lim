import 'package:desktop_app/Feature/Auth/SignIn/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/function/show_snak_bar.dart';
import '../../../../../core/helper/navigation/navigation.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../Home/view/screen/home_screen.dart';
import '../../logic/login_cubit.dart';

class LoginButtonStateWidget extends StatelessWidget {
  const LoginButtonStateWidget({super.key, required this.logInCubit});

  final LoginCubit logInCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            pushReplacement(context, HomeScreen());
          },
          error: (error) {
            showSnakBarError(context, error);
          },
        );
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            logInCubit.emitLoginStates();
          },
          title: state.maybeWhen(
            orElse: () => Text(
              'Log In',
              style: AppTextStyle.fontWeightw400Size18ColorWhite(),
            ),
            loading: () => CustomLoadingIndicator(),
          ),
        );
      },
    );
  }
}
