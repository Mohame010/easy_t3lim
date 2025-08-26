import 'dart:developer';

import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/Feature/Home/view/screen/home_screen.dart';
import 'package:desktop_app/core/function/window_option.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/local_database/helper/hive_helper.dart';
import 'package:desktop_app/core/service/windows_kayboard_blocker.dart';
import 'package:desktop_app/core/utils/extensions/string_extensions.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'Feature/Home/view/screen/overlay_wrapper.dart';
import 'core/service/service_locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KeyboardBlocker.start();

  await windowManager.ensureInitialized();

  WindowOptionFunction.windowOption();

  await CacheHelper.init();

  await HiveHelper.initHive();
  setupGetIt();
  await checkIfLoggedInUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: isLoggedInUser ? HomeScreen() : LoginScreen(),
    );
  }
}

checkIfLoggedInUser() async {
  String? userToken = await CacheHelper.getSecuredString(
    ShardPrefKeys.userToken,
  );

  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
