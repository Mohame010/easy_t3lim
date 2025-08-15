import 'package:desktop_app/Feature/Auth/SignUp/logic/sign_up_cubit.dart';
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
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          pushReplacement(context, WebViewPage());
              } else if (state is SignUpFailureState) {
          showSnakBar(context, state.erroreMessag);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            context.read<SignUpCubit>().emitSignUpState();
          },
          title: state is SignUpLoadingState
              ? CustomLoadingIndicator()
              : Text(
                  'Sign In',
                  style: AppTextStyle.fontWeightw400Size18ColorWhite(),
                ),
        );
      },
    );
  }
}
