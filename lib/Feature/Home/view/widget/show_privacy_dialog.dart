import 'dart:core';
import 'dart:io';

import 'package:desktop_app/core/service/app_control.dart';
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

Future<void> showCloseAppsDialog() async {
  final context = navigatorKey.currentContext;
  if (context == null) return;

  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false, // ما يقدرش يقفله بالضغط برّه
    builder: (context) => AlertDialog(
      title: const Text(
        'تنبيه هام',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'هذا التطبيق سيقوم بإغلاق جميع البرامج الأخرى المفتوحة لحماية الخصوصية.\n'
        'هل توافق على الاستمرار؟',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false); // رفض
          },
          child: const Text('رفض'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true); // موافق
          },
          child: const Text('موافق'),
        ),
      ],
    ),
  );

  if (result == true) {
    // وافق → نقفل البرامج ونكمل
    await AppControl.closeOtherApps();
  } else {
    // رفض → نقفل الأبلكيشن كله
    exit(0);
  }
}
