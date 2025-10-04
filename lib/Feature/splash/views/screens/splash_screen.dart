import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/Feature/Home/view/screen/home_screen.dart';
import 'package:desktop_app/Feature/splash/data/repos/splash_repo.dart';
import 'package:desktop_app/core/helper/constans.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashRepo _repo;

  @override
  void initState() {
    super.initState();
    _repo = SplashRepo(Dio());
    _checkAppVersion();
  }

  Future<void> _checkAppVersion() async {
    try {
      final updateInfo = await _repo.getAppUpdateInfo();

      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      debugPrint('🔹 Local version: $currentVersion');
      debugPrint('🔹 Server version: ${updateInfo.lastVersion}');

      if (_isVersionLower(currentVersion, updateInfo.lastVersion)) {
        _showUpdateDialog(updateInfo.downloadLink);
      } else {
        // المستخدم محدث فعلاً → كمل التطبيق
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => isLoggedInUser ? HomeScreen() : LoginScreen(),
            ),
          );
        });
      }
    } catch (e) {
      debugPrint('Error checking update: $e');
    }
  }

  bool _isVersionLower(String local, String remote) {
    final localParts = local.split('.').map(int.parse).toList();
    final remoteParts = remote.split('.').map(int.parse).toList();

    for (int i = 0; i < remoteParts.length; i++) {
      final l = i < localParts.length ? localParts[i] : 0;
      final r = remoteParts[i];
      if (l < r) return true;
      if (l > r) return false;
    }
    return false; // متساويين
  }

  void _showUpdateDialog(String downloadLink) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('تحديث جديد متاح'),
          content: const Text(
            'هناك إصدار جديد من التطبيق. يجب عليك تحديث التطبيق للمتابعة.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(downloadLink);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint('Could not launch $downloadLink');
                }
              },
              child: const Text('تحديث الآن'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
