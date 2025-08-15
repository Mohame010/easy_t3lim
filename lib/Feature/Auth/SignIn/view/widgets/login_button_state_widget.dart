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
    return BlocConsumer<LoginCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccessState) {
          pushReplacement(context, WebViewPage());
        } else if (state is LogInFailureState) {
          showSnakBar(context, state.erroreMessag);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            logInCubit.emitLogInState();
          },
          title: state is LogInLoadingState
              ? CustomLoadingIndicator()
              : Text(
                  'Log In',
                  style: AppTextStyle.fontWeightw400Size18ColorWhite(),
                ),
        );
      },
    );
  }
}
