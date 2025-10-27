import 'package:flutter/services.dart';


class KeyboardBlocker {
  static const _ch = MethodChannel('keyboard_blocker');

  static Future<void> start() => _ch.invokeMethod('startBlocker');
  static Future<void> stop()  => _ch.invokeMethod('stopBlocker');
}
