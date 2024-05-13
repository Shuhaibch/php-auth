import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static late final SharedPreferences preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  saveToken(String token) {
    preferences.setString("token", token);
  }

  getToken() {
    return preferences.getString("token");
  }
}
