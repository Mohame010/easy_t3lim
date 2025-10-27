
import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class OverlayWrapper extends StatefulWidget {
  const OverlayWrapper({super.key});

  @override
  State<OverlayWrapper> createState() => _OverlayWrapperState();
}

class _OverlayWrapperState extends State<OverlayWrapper> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     final context = navigatorKey.currentState?.context;
  //     if (context != null) {
  //       await checkUser(context);
  //       final isAdmin = await isRunningAsAdmin();
  //     if (!isAdmin) {
  // bool userAgreed = false;
  // if (Platform.isWindows) {
  //   userAgreed = await showPrivacyDialogWindows();
  // } else if (Platform.isMacOS || Platform.isLinux) {
  //   userAgreed = await showPrivacyDialogMacOsAndLinux();
  // }

  // if (userAgreed) {
  //   // ✅ هنا بس لو وافق، نعيد التشغيل كـ Admin
  //   relaunchAsAdmin();
  // } else {
  //   // ❌ المستخدم رفض → نقفل التطبيق أو نرجع
  //   Future.delayed(Duration(milliseconds: 200), () {
  //     exit(0);
  //   });
  // }
  // } else {
  //   // هو أصلًا Admin
  //   await showCloseAppsDialog();
  //   ScreenRecorderBlocker.startMonitoring(context);
  // }}});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
