import 'package:shared_preferences/shared_preferences.dart';

class CacheConstants {}

class CacheService {
  static late SharedPreferences sharedPreferences;

  static Future<void> cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    }
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    }
    if (value is double) {
      return sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      return sharedPreferences.setStringList(key, value);
    }
    return false;
  }

  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> deleteItem({required String key}) async {
    return sharedPreferences.remove(key);
  }

  static Future<bool> clearItems() async {
    return sharedPreferences.clear();
  }
}
