import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../helper/spacing.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.color,
    this.height,
    this.width, this.heightVerticalSpacing,
  });
  final double? heightVerticalSpacing ;
  final Color? color;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       verticalSpace(heightVerticalSpacing?? 6),
        SizedBox(
          height: height ?? 40,
          width: width ?? 40,
          child: Center(
            child: CircularProgressIndicator(color: color ?? AppColors.white),
          ),
        ),
      ],
    );
  }
}
