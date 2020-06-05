import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/pages/login/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static final controller = Modular.get<LoginController>();

  static final String tokenKey = 'token';
  static final String userId = 'user_id';
  static final String name = 'name';
  static final String email = 'email';

  static bool isLogged() {
    if (controller.token != '' && controller.token != null)
      return true;
    else
      return false;
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(tokenKey);
    return token;
  }

  static void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
  }

  Auth.insertDetails(User user, SharedPreferences prefs) {
    prefs.setString(name, user.username);
    prefs.setInt(userId, user.id);
    prefs.setString(email, user.email);
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
