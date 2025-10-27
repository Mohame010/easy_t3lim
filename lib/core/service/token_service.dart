import 'dart:async';
import 'dart:developer';
import 'package:desktop_app/Feature/Auth/SignIn/view/screen/login_screen.dart';
import 'package:desktop_app/core/network/local_database/helper/hive_helper.dart';
import 'package:desktop_app/core/network/repos/token_repo.dart';
import 'package:desktop_app/core/utils/helper/cache_helper.dart';
import 'package:desktop_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TokenService with ChangeNotifier {
  final TokenRepo repo;
  String? _token;
  Timer? _timer;
  bool _isTokenValid = true;

  bool get isTokenValid => _isTokenValid;

  TokenService(this.repo);

  void setToken(String token) {
    _token = token;
    _startListening();
  }

  void _startListening() {
    _timer?.cancel();

    if (isTokenValid) {
      _timer = Timer.periodic(
        const Duration(seconds: 30),
        (_) => _checkToken(),
      );
    }
  }

  Future<void> _checkToken() async {
    if (_token == null) return;

    try {
      final result = await repo.checkToken(_token!);

      if (result.status == false && _isTokenValid != false) {
        _isTokenValid = false;
        await CacheHelper.clearAllData();
        await HiveHelper.deleteUserData();

        _timer?.cancel();
        _token = null;

        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint('Token check failed: $e');
    }
  }

  void stopListening() {
    _timer?.cancel();
  }

  void logout() {
    _token = null;
    _isTokenValid = false;
    _timer?.cancel();
    notifyListeners();
  }
}
