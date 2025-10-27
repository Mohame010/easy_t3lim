import 'package:flutter/services.dart';


class AppControl {
  static const _channel = MethodChannel('app_control_channel');

  static Future<void> exitApp() async => _channel.invokeMethod('exitApp');
  static Future<void> lockMode() async => _channel.invokeMethod('lockMode');
  static Future<void> unlockMode() async => _channel.invokeMethod('unlockMode');
  static Future<void> closeOtherApps() async => _channel.invokeMethod('closeOtherApps');
}
