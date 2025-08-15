import 'dart:developer';
import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/Feature/Home/view/screen/home_screen.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/helper/shared_pref.dart';

Future< void> checkUser(context) async {
  log('✅ checkUser called');

  final isSignedIn = AppSharedPrefs.getBool(ShardPrefKeys.isSignedIn) ?? false;
  log('✅ isSignedIn: $isSignedIn');

  final token = AppSharedPrefs.getString(ShardPrefKeys.userToken);
  log('✅ Encrypted token: $token');

  if (!isSignedIn) {
    log('🔴 User not signed in — going to Login');
    pushReplacement(context, LoginScreen());
  } else {
    log('🟢 User signed in — going to WebView');
    pushReplacement(context, WebViewPage());
  }
}
