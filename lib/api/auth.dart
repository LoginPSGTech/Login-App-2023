import 'package:login/api/constants.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/user.dart';
import 'package:login/utils/preferences.dart';

import 'api.dart';

class LoginException implements Exception {
  String message;

  LoginException({this.message = "Failed to Login"});
}

class AuthApi {
  static Future<Function> authGet(Function apiGet) async {
    return (String url) async {
      try {
        return await apiGet(url);
      } on UnauthorizedException {
        await refreshAccess();
        return await apiGet(url);
      }
    };
  }

  static Future<Function> authPost(Function apiPost) async {
    return (String url, Map<String, dynamic> body) async {
      try {
        return await apiPost(url, body);
      } on UnauthorizedException {
        await refreshAccess();
        return await apiPost(url, body);
      }
    };
  }

  static Future<void> login(LoginModel loginModel) async {
    Map<String, dynamic> response = await APIWrapper.post(ApiConstants.token, loginModel.toJson());
    LoginResponseModel loginResponse = LoginResponseModel.fromJson(response);
    UserPreferences.setTokens(loginResponse);
  }

  static Future<void> logout() async {
    await UserPreferences.removeTokens();
  }

  static Future<void> refreshAccess() async {
    String refreshToken = await UserPreferences.getToken(TokenType.refresh);
    Map<String, dynamic> response = await APIWrapper.post(ApiConstants.tokenRefresh, {"refresh": refreshToken});
    UserPreferences.setToken(TokenType.access, response["access"]);
  }

  static Future<UserModel> getUser() async {
    Function authGetUser = await authGet(APIWrapper.get);
    Map<String, dynamic> response = await authGetUser(ApiConstants.user);
    return UserModel.fromJson(response);
  }
}
