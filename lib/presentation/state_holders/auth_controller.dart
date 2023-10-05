import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;

  static String? get token => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    await sharedPreference.setString("access_token", token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreference.getString("access_token");
  }


  static Future<void> clear() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    await sharedPreference.clear();
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}
