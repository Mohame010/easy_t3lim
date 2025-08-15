import 'package:desktop_app/Feature/Auth/SignUp/view/screen/sign_up_screen.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/helper/navigation/navigation.dart';
import 'package:desktop_app/core/helper/token_encryptor.dart';
import 'package:desktop_app/core/helper/shared_pref.dart';
import 'package:desktop_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:webview_windows/webview_windows.dart';
import '../../../../core/utils/app_colors.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final webviewController = WebviewController();

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  Future<void> initWebView() async {
    final encryptedToken = AppSharedPrefs.getString(ShardPrefKeys.userToken);
    final decryptedToken = TokenEncryptor.decryptToken(encryptedToken ?? '');
    await AppSharedPrefs.setBool(ShardPrefKeys.isSignedIn, true);
    final url = "https://easyta3lim.com/home?auth_token=$decryptedToken";
    await webviewController.initialize();
    await webviewController.loadUrl(url);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          isInitialized = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              await AppSharedPrefs.clear();
              
              pushReplacement(context, SignUpScreen());
            },
            icon: Icon(Icons.logout, color: Colors.black),
          ),
          Spacer(flex: 1),
          IconButton(
            onPressed: () async {
              await windowManager.destroy();
            },
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: isInitialized
          ? Webview(webviewController)
          : const Center(
              child: CustomLoadingIndicator(
                heightVerticalSpacing: 200,
                color: AppColors.black,
              ),
            ),
    );
  }
}
