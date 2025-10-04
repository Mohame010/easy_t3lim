import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:desktop_app/core/network/local_database/helper/hive_helper.dart';
import 'package:desktop_app/core/service/token_service.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:desktop_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:webview_windows/webview_windows.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final webviewController = WebviewController();

  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  Future<void> initWebView() async {
    final userToken = await CacheHelper.getSecuredString(
      ShardPrefKeys.userToken,
    );
    final url = "https://easyta3lim.com/home?auth_token=$userToken";

    final tokenService = Provider.of<TokenService>(context, listen: false);
    tokenService.setToken("$userToken");

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
        leading: IconButton(
          onPressed: () async {
            await CacheHelper.clearAllData();
            await HiveHelper.deleteUserData();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
          icon: Icon(Icons.logout, color: AppColors.mainColor),
        ),
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
