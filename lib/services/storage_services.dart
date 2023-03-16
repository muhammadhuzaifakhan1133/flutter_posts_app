import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserId(String id) async {
    await _prefs.setString("user_id", id);
  }

  static String? getUserId() {
    return _prefs.getString("user_id");
  }

  static Future<void> deleteUserId() async {
    await _prefs.remove("user_id");
  }
}