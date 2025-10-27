import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_cubit.dart';
import 'package:desktop_app/Feature/Auth/SignUp/logic/signup_state.dart';
import 'package:desktop_app/core/function/show_snak_bar.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/service/token_service.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:desktop_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../Home/view/screen/home_screen.dart';
import 'package:provider/provider.dart';

class SignUpButtonState extends StatelessWidget {
  const SignUpButtonState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () async {
            final userToken = await CacheHelper.getSecuredString(
              ShardPrefKeys.userToken,
            );
            final tokenService = Provider.of<TokenService>(
              context,
              listen: false,
            );
            tokenService.setToken("$userToken");
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
