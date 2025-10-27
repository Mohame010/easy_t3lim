import 'dart:developer';

import 'package:flutter/services.dart';

class CloseApps {
  static const _channel = MethodChannel('app_killer');

  static Future<void> closeAll() async {
    try {
      await _channel.invokeMethod('kill_all_except_me');
    } catch (e) {
      log("Error closing apps: $e");
    }
  }
}
