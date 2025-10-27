import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

showSnakBar(BuildContext context, String messeg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(duration: Duration(seconds: 2), content: Text(messeg)),
  );
}

showSnakBarError(BuildContext context, String messeg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Text(messeg),
      backgroundColor: AppColors.red,
    ),
  );
}
