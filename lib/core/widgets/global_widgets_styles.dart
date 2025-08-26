import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalAppWidgetsStyles {
  GlobalAppWidgetsStyles._();

  static InputBorder appFocusedBorder(BuildContext context) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static InputBorder appEnabledBorder(BuildContext context) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static InputBorder appErrorBorder(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static BoxBorder containerGrayBoxBorder(BuildContext context) => Border.all(
      color: AppColors.black.withOpacity(.3), width: 1.5);


  // static Widget settingArrowWidget(BuildContext context) => SvgPicture.asset(
  //       context.locale.languageCode == "ar"
  //           ? AppSvgs.settingsArrowLeft
  //           : AppSvgs.settingsArrowLeft,
  //       color: AppColors.redColor,
  //     );
}
