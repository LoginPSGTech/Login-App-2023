import 'package:login/models/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static void setTokens(LoginResponseModel loginResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(TokenType.access.toString(), loginResponseModel.access);
    prefs.setString(TokenType.refresh.toString(), loginResponseModel.refresh);
  }

  static void setToken(TokenType tokenType, String tokenValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenType.toString(), tokenValue);
  }

  static Future<String> getToken(TokenType tokenType) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenType.toString()) ?? "";
  }

  static Future<void> removeTokens() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(TokenType.access.toString());
    prefs.remove(TokenType.refresh.toString());
  }
}
