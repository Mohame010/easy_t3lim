import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle meduimBody16W500DarkAndLightThemeTitleTextStyle(
    BuildContext context,
  ) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.mainColor,
  );
  static TextStyle textFieldHintText16w500Style(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      );

  static TextStyle meduimHead16w500TitleTextStyle(BuildContext context) {
    final color =
        Theme.of(context).textTheme.bodyLarge?.color ??
        AppColors.white; // fallback

    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static const fontWeightBoldSize20 = TextStyle(
    color: AppColors.mainColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const fontSize32Bold = TextStyle(
    color: AppColors.textMainColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const fontWeightRegularSize16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const fontSize14Bold = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const fontWeightW700Size18ColorMain = TextStyle(
    color: AppColors.mainColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
