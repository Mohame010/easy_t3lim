import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:desktop_app/main.dart';
import 'package:flutter/material.dart';
import '../../Feature/Home/view/screen/overlay_entry_black_screen.dart';

//بيظهر شاشة سودا لو اكتشف ان تطبيق بيسجل
class ScreenRecorderBlocker {
  static final List<String> nameOfRecorderApp = [
    'obs',
    'obs64',
    'obs32',
    'quicktime',
    'bdcam',
    'camtasia',
    'screenrec',
    'snagit',
    'gamebar',
    'flashbackrecorder',
    'apowerrec',
    'icecream',
    'screenflow',
    'debut',
    'loom',
    'screencast',
    'recordit',
    'kazam',
    'simplescreenrecorder',
  ];

  // OverlayEntry لعرض الشاشة السوداء
  // Timer لمراقبة التطبيقات التي تسجل الشاشة
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  // windowManager لإدارة نافذة التطبيق
  static void startMonitoring(context) async {
    final isRecordingNow = await _isScreenRecorderRunning();
    if (isRecordingNow) {
      showBlackOverlayScreen(context);
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final isRecording = await _isScreenRecorderRunning();
      if (isRecording) {
        showBlackOverlayScreen(context);
      } else {
        _removeBlackOverlayScreen();
      }
    });
  }

  static Future<bool> _isScreenRecorderRunning() async {
    ProcessResult result;
    // استخدام PowerShell للحصول على قائمة العمليات
    if (Platform.isWindows) {
      result = await Process.run('powershell', [
        '-Command',
        'Get-Process | Select-Object Name',
      ]);
    } else if (Platform.isLinux || Platform.isMacOS) {
      result = await Process.run('ps', ['aux']);
    } else {
      return false; // لا ندعم أنظمة تشغيل أخرى
    }
    // التحقق من وجود أي من تطبيقات تسجيل الشاشة في قائمة العمليات
    if (result.stdout == null) return false;
    for (String name in nameOfRecorderApp) {
      if (result.stdout.toString().toLowerCase().contains(name.toLowerCase())) {
        log('📹 تم الكشف عن مسجل شاشة: $name');
        return true;
      }
    }
    return false;
  }

  static void showBlackOverlayScreen(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(builder: (_) => OverlayEntryBlackScreen());

    final overlay = navigatorKey.currentState?.overlay;
    if (_overlayEntry != null) {
      overlay?.insert(_overlayEntry!);
    }
  }

  static void _removeBlackOverlayScreen() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  static void dispose() {
    _timer?.cancel();
    _removeBlackOverlayScreen();
  }
}



