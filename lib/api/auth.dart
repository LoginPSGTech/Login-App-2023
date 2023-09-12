import 'package:login/api/endpoints.dart';
import 'package:login/models/auth.dart';
import 'package:login/utils/preferences.dart';

import 'api.dart';

class LoginException implements Exception {
  String message;

  LoginException({this.message = "Failed to Login"});
}

class AuthApi {
  static Future<Function> payloadLessAuth(Function api) async {
    return (String url, {bool authenticate = false}) async {
      try {
        return await api(url, authenticate: authenticate);
      } on UnauthorizedException {
        await refreshAccess();
        return await api(url, authenticate: authenticate);
      }
    };
  }

  static Future<Function> payloadAuth(Function api) async {
    return (String url, Map<String, dynamic> body, {bool authenticate = false}) async {
      try {
        return await api(url, body, authenticate: authenticate);
      } on UnauthorizedException {
        await refreshAccess();
        return await api(url, body, authenticate: authenticate);
      }
    };
  }

  static Future<void> login(LoginModel loginInfo) async {
    Map<String, dynamic> response = await ApiWrapper.post(ApiEndpoints.token, loginInfo.toJson());
    LoginResponseModel loginResponse = LoginResponseModel.fromJson(response);
    UserPreferences.setTokens(loginResponse);
  }

  static Future<void> logout() async {
    await UserPreferences.removeTokens();
  }

  static Future<void> refreshAccess() async {
    String refreshToken = await UserPreferences.getToken(TokenType.refresh);
    Map<String, dynamic> response = await ApiWrapper.post(ApiEndpoints.tokenRefresh, {"refresh": refreshToken});
    UserPreferences.setToken(TokenType.access, response["access"]);
  }

  static Future<void> verifyEmail(String email) async {
    await ApiWrapper.post(ApiEndpoints.otp, {"email": email});
  }
}
