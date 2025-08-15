import 'package:flutter/material.dart';
import '../../../../../core/helper/spacing.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {}, child: Text('Forget Password?')),
        ),
        verticalSpace(20),
      ],
    );
  }
}