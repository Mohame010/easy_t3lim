import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceUDID() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    return androidDeviceInfo.id;
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsDeviceInfo = await deviceInfoPlugin.windowsInfo;
    return windowsDeviceInfo.deviceId ;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    return iosDeviceInfo.identifierForVendor ?? "unknown_udid";
  } else {
    return 'unsupported_platform';
  }
}
