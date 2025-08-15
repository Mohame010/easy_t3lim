import 'package:flutter/material.dart';

import '../../../../main.dart';

Future<bool> showPrivacyDialogWindows() async {
  final context = navigatorKey.currentContext;
  if (context == null) return false;

  return await showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('الخصوصية'),
    content: Text(
      'لحماية الخصوصية Administrato هذا التطبيق يحتاج إلى صلاحيات-\nهل توافق على إعادة تشغيل التطبيق بصلاحيات المسؤول؟',
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
) ?? false; 

}
