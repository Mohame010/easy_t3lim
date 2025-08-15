import 'package:flutter/material.dart';

import '../helper/spacing.dart';

class AlignLeftText extends StatelessWidget {
  const AlignLeftText({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         verticalSpace(10),
        Align(alignment: Alignment.bottomLeft, child: Text(text)),
      ],
    );
  }
}