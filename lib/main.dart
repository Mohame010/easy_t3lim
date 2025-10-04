import 'dart:developer';
import 'dart:io';
import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/Feature/splash/views/screens/splash_screen.dart';
import 'package:desktop_app/core/function/window_option.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/dio_factory.dart';
import 'package:desktop_app/core/network/local_database/helper/hive_helper.dart';
import 'package:desktop_app/core/network/repos/token_repo.dart';
import 'package:desktop_app/core/service/token_service.dart';
import 'package:desktop_app/core/service/windows_kayboard_blocker.dart';
import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:desktop_app/core/utils/extensions/string_extensions.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'core/service/service_locator.dart';
import 'package:provider/provider.dart';

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
  runApp(
    ChangeNotifierProvider(
      create: (_) => TokenService(TokenRepo(DioFactory.dio!)),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              top: 40,
              right: 10,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: AppColors.mainColor,
                onPressed: () {
                  _showExitDialog();
                },
                child: const Icon(Icons.exit_to_app, color: AppColors.white),
              ),
            ),
          ],
        );
      },
      home: SplashScreen(),
    );
  }

  void _showExitDialog() {
    final ctx = navigatorKey.currentState!.overlay!.context;

    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: const Text("تأكيد الخروج"),
        content: const Text("هل انت متأكد انك عايز تخرج من التطبيق؟"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("خروج", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
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
