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
  // checkAuth(func)();
  static Future<Function> checkAuth(Function func) async {
    return () async {
      try {
        await func();
      } on UnauthorizedException {
        await refreshAccess();
        await func();
      }
    };
  }

  static Future<void> login(LoginModel loginModel) async {
    Map<String, dynamic> response = await APIWrapper.post(ApiConstants.token, loginModel.toJson());
    LoginResponseModel loginResponse = LoginResponseModel.fromJson(response);
    UserPreferences.setTokens(loginResponse);
  }

  static Future<void> refreshAccess() async {
    String refreshToken = await UserPreferences.getToken(TokenType.refresh);
    Map<String, dynamic> response = await APIWrapper.post(ApiConstants.tokenRefresh, {"refresh": refreshToken});
    UserPreferences.setToken(TokenType.access, response["access"]);
  }

  static Future<UserModel?> getUser() async {
    Map<String, dynamic> response = await APIWrapper.get(ApiConstants.user);
    return UserModel.fromJson(response);
  }

  static Future<bool> checkLogin() async {
    Function func = await checkAuth(getUser);
    try {
      await func();
    } on APIException {
      return false;
    }
    return true;
  }
}
