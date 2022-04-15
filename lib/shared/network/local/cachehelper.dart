
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) {
    return sharedPreferences.remove(key);
  }
  static Future<bool> removeAllData() {
    return sharedPreferences.clear();
  }
}

