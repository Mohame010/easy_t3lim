import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowOptionFunction {
  static void windowOption() {
    WindowOptions windowOptions = WindowOptions(
      size: Size(1280, 720),
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
      title: 'Easy t3lim App',
      fullScreen: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setPreventClose(true);
      await windowManager.setFullScreen(true);
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
