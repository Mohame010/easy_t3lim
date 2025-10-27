// main.dart
import 'dart:async';
import 'dart:developer';
import 'dart:io';

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
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'core/service/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// ==================== VM Detection Helpers ====================

/// Returns true if multiple heuristics indicate a Virtual Machine environment.
Future<bool> isVmEnvironment({int requiredScore = 2}) async {
  int score = 0;

  try {
    // --- 1) MAC address prefixes ---
    try {
      final macResult = await Process.run('getmac', []);
      final output = macResult.stdout.toString().toLowerCase();

      final vmMacPrefixes = <String>{
        '00:05:69', // VMware
        '00:0c:29',
        '00:1c:14',
        '00:50:56',
        '08:00:27', // VirtualBox
        '0a:00:27',
        '00:15:5d', // Hyper-V
      };

      bool macMatch = vmMacPrefixes.any(
        (prefix) => output.contains(prefix.toLowerCase()),
      );
      if (macMatch) {
        log('VM Detector: MAC match found');
        score++;
      }
    } catch (e) {
      log('VM Detector: MAC check failed: $e');
    }

    // --- 2) WMIC / System Model / Manufacturer ---
    try {
      final modelResult = await Process.run('wmic', [
        'computersystem',
        'get',
        'model',
      ]);
      final manufacturerResult = await Process.run('wmic', [
        'computersystem',
        'get',
        'manufacturer',
      ]);
      final modelOut = modelResult.stdout.toString().toLowerCase();
      final manuOut = manufacturerResult.stdout.toString().toLowerCase();

      if (modelOut.contains('virtual') ||
          modelOut.contains('vmware') ||
          modelOut.contains('virtualbox') ||
          modelOut.contains('kvm') ||
          modelOut.contains('qemu')) {
        log('VM Detector: WMIC model hint -> $modelOut');
        score++;
      } else if (manuOut.contains('microsoft corporation') &&
          manuOut.contains('virtual')) {
        log('VM Detector: WMIC manufacturer hint -> $manuOut');
        score++;
      }
    } catch (e) {
      log('VM Detector: WMIC check failed: $e');
    }

    // --- 3) Known VM processes/services ---
    try {
      final taskResult = await Process.run('tasklist', []);
      final out = taskResult.stdout.toString().toLowerCase();

      final vmProcessIndicators = [
        'vmtools', // VMware tools
        'vboxservice', // VirtualBox
        'vboxtray',
        'vmware',
        'vmmem', // Hyper-V memory
      ];

      bool procMatch = vmProcessIndicators.any((p) => out.contains(p));
      if (procMatch) {
        log('VM Detector: Found VM-related process');
        score++;
      }
    } catch (e) {
      log('VM Detector: tasklist check failed: $e');
    }

    // --- 4) Hypervisor bit ---
    try {
      final sysResult = await Process.run('systeminfo', []);
      final sysOut = sysResult.stdout.toString().toLowerCase();
      if (sysOut.contains('hyper-v requirements') ||
          sysOut.contains('hyper-v')) {
        log('VM Detector: systeminfo hint -> hyper-v text found');
        score++;
      }
    } catch (e) {
      log('VM Detector: CPU virtualization check failed: $e');
    }

    log('VM Detector: final score = $score (required = $requiredScore)');
  } catch (e) {
    log('VM detection unexpected error: $e');
  }

  return score >= requiredScore;
}

// ==================== End VM Detection ====================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await KeyboardBlocker.start();

  await windowManager.ensureInitialized();
  WindowOptionFunction.windowOption();

  await CacheHelper.init();
  await HiveHelper.initHive();
  setupGetIt();

  // 🔥 تحقق من البيئة قبل تشغيل التطبيق
  final isVm = await isVmEnvironment();
  if (isVm) {
    // لو اكتشفنا VM — نعرض شاشة حظر بسيطة ونوقف تحميل باقي الموارد الحساسة
    await SentryFlutter.init(
    (options) {
      options.dsn = 'https://6e7a98f7cc33446c0471f5c0357ea168@o4510134382166016.ingest.us.sentry.io/4510134384852992';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(SentryWidget(child: 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 72,
                    color: Colors.redAccent,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '⚠️ التطبيق لا يعمل على بيئات وهمية (Virtual Machines)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'لأسباب أمنية، لا يمكن تشغيل هذا التطبيق داخل جهاز افتراضي.\n'
                    'يرجى تشغيل التطبيق على جهاز حقيقي أو التواصل مع الدعم.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )),
  );
  // TODO: Remove this line after sending the first sample event to sentry.
  await Sentry.captureException(Exception('This is a sample exception.'));
    return;
  }

  // لو مش VM — تكملة الإعدادات العادية
  await checkIfLoggedInUser();

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://6e7a98f7cc33446c0471f5c0357ea168@o4510134382166016.ingest.us.sentry.io/4510134384852992';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(SentryWidget(child: 
    ChangeNotifierProvider(
      create: (_) => TokenService(TokenRepo(DioFactory.dio!)),
      child: const MyApp(),
    ),
  )),
  );
  // TODO: Remove this line after sending the first sample event to sentry.
  await Sentry.captureException(Exception('This is a sample exception.'));
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
