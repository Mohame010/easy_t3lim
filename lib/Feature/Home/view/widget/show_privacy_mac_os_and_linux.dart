import 'package:flutter/material.dart';

import '../../../../main.dart';

Future<bool> showPrivacyDialogMacOsAndLinux( ) async {
  final context = navigatorKey.currentContext;
  if (context == null) return false;

  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('الخصوصية'),
      content: Text(
        '.لتفعيل بعض الوظائف مثل منع تسجيل الشاشة sudo من فضلك شغل البرنامج باستخدام',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.start,
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('لا'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('موافق'),
        ),
      ],
    ),
  );
}
