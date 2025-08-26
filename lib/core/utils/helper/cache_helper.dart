import 'package:desktop_app/core/helper/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  CacheHelper._();

  static late SharedPreferences _sharedPreferences;
  static const _flutterSecureStorage = FlutterSecureStorage();

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    await _sharedPreferences.clear();
    await clearSecured(ShardPrefKeys.userToken);
    return true;
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<bool> setData(String key, value) async {
    switch (value) {
      case String _:
        return await _sharedPreferences.setString(key, value);
      case int _:
        return await _sharedPreferences.setInt(key, value);
      case bool _:
        return await _sharedPreferences.setBool(key, value);
      case double _:
        return await _sharedPreferences.setDouble(key, value);
      default:
        return false;
    }
  }

  static bool? getBool(String key) => _sharedPreferences.getBool(key);

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _sharedPreferences.getDouble(key) ?? defaultValue;
  }

  static int? getInt(String key) => _sharedPreferences.getInt(key);

  static String? getString(String key) => _sharedPreferences.getString(key);

  /// Saves a [value] with a [key] in the [FlutterSecureStorage].
  static Future<void> setSecuredString(String key, String value) async {
    return await _flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String?> getSecuredString(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static Future<void> clearSecured(String key) async {
    return await _flutterSecureStorage.delete(key: key);
  }
}
