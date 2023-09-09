import 'package:login/api/endpoints.dart';
import 'package:login/models/auth.dart';
import 'package:login/utils/preferences.dart';

import 'api.dart';

class LoginException implements Exception {
  String message;

  LoginException({this.message = "Failed to Login"});
}

class AuthApi {
  static Future<Function> authGet(Function apiGet) async {
    return (String url, {bool authenticate = false}) async {
      try {
        return await apiGet(url, authenticate: authenticate);
      } on UnauthorizedException {
        await refreshAccess();
        return await apiGet(url, authenticate: authenticate);
      }
    };
  }

  static Future<Function> authPost(Function apiPost) async {
    return (String url, Map<String, dynamic> body, {bool authenticate = false}) async {
      try {
        return await apiPost(url, body, authenticate: authenticate);
      } on UnauthorizedException {
        await refreshAccess();
        return await apiPost(url, body, authenticate: authenticate);
      }
    };
  }

  static Future<void> login(LoginModel loginModel) async {
    Map<String, dynamic> response = await APIWrapper.post(APIEndpoints.token, loginModel.toJson());
    LoginResponseModel loginResponse = LoginResponseModel.fromJson(response);
    UserPreferences.setTokens(loginResponse);
  }

  static Future<void> logout() async {
    await UserPreferences.removeTokens();
  }

  static Future<void> refreshAccess() async {
    String refreshToken = await UserPreferences.getToken(TokenType.refresh);
    Map<String, dynamic> response = await APIWrapper.post(APIEndpoints.tokenRefresh, {"refresh": refreshToken});
    UserPreferences.setToken(TokenType.access, response["access"]);
  }

  static Future<void> verifyEmail(String email) async {
    await APIWrapper.post(APIEndpoints.otp, {"email": email});
  }
}
