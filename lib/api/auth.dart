import 'package:flutter/material.dart';
import 'package:login/api/endpoints.dart';
import 'package:login/models/auth.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/utils/preferences.dart';

import 'api.dart';

class TokenExpiredException implements Exception {
  String message;

  TokenExpiredException({this.message = "Refresh token expired"});
}

class AuthApi {
  static Future<Function> payloadLessAuth(Function api, BuildContext context) async {
    return (String url, {bool authenticate = false}) async {
      try {
        return await api(url, authenticate: authenticate);
      } on AuthException {
        if (authenticate) {
          await refreshAccess().catchError((err) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
          return await api(url, authenticate: authenticate);
        } else {
          throw AuthException();
        }
      }
    };
  }

  static Future<Function> payloadAuth(Function api, BuildContext context) async {
    return (String url, Map<String, dynamic> body, {bool authenticate = false}) async {
      try {
        return await api(url, body, authenticate: authenticate);
      } on AuthException {
        if (authenticate) {
          await refreshAccess().catchError((err) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
          return await api(url, body, authenticate: authenticate);
        } else {
          throw AuthException();
        }
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
    try {
      Map<String, dynamic> response = await ApiWrapper.post(ApiEndpoints.tokenRefresh, {"refresh": refreshToken});
      UserPreferences.setToken(TokenType.access, response["access"]);
    } on AuthException {
      throw TokenExpiredException();
    }
  }

  static Future<void> verifyEmail(String email) async {
    await ApiWrapper.post(ApiEndpoints.otp, {"email": email});
  }
}
