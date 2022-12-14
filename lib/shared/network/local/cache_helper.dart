// import 'package:shared_preferences/shared_preferences.dart';

// class CacheHelper {
//   static late SharedPreferences sp;
//   static init() async {
//     sp = await SharedPreferences.getInstance();
//   }

//   static Future<bool> putBolean({
//     required String key,
//     required bool value,
//   }) async {
//     return await sp.setBool(key, value);
//   }

//   static bool? getBolean({
//     required String key,
//   }) {
//     return sp.getBool(key);
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sp;
  static init() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future<bool> potBolean({
    required String key,
    required bool value,
  }) async {
    return await sp.setBool(key, value);
  }

  static bool? getBolean({
    required String key,
  }) {
    return sp.getBool(key);
  }
}
