import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future getOauthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("oauthToken") ?? "";
  }

  void setOauthToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("oauthToken", token);
  }
}
