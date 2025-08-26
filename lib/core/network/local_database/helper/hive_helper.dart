import 'package:desktop_app/core/network/local_database/models/cached_user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const userBoxName = 'usersBox';
  HiveHelper._();

  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CachedUserModelAdapter());

    await Hive.openBox(userBoxName);
  }

  static Future<void> saveUserData({required CachedUserModel userData}) async {
    final box = Hive.box(userBoxName);
    await box.put(userBoxName, userData);
  }

  static CachedUserModel? getUserData() {
    final box = Hive.box(userBoxName);
    return box.get(userBoxName); 
  }

  static Future<void> deleteUserData() async {
    final box = Hive.box(userBoxName);
    await box.delete(userBoxName);
  }

  static Future<void> closeHive() async {
    await Hive.box(userBoxName).close();
  }
}
