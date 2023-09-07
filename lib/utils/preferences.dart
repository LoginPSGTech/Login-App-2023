import 'package:login/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static void setTokens(LoginResponseModel loginResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(TokenType.access.toString(), loginResponseModel.access);
    await prefs.setString(TokenType.refresh.toString(), loginResponseModel.refresh);
  }

  static void setToken(TokenType tokenType, String tokenValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenType.toString(), tokenValue);
  }

  static Future<String> getToken(TokenType tokenType) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenType.toString()) ?? "";
  }
}
