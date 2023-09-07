import 'package:login/api/constants.dart';
import 'package:login/models/token.dart';
import 'package:login/models/user.dart';
import 'package:login/utils/preferences.dart';

import 'api.dart';

class LoginException implements Exception {
  String message;

  LoginException({this.message = "Failed to Login"});
}

class AuthApi {
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

  static Future<UserModel> getUser() async {
    Map<String, dynamic> response = await APIWrapper.get(ApiConstants.tokenRefresh);
    return UserModel.fromJson(response);
  }
}
