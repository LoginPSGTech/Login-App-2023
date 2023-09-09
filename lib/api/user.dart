import 'package:login/api/api.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/user.dart';

import 'endpoints.dart';

class UserApi {
  static Future<UserModel> getUser() async {
    Function authGetUser = await AuthApi.authGet(APIWrapper.get);
    Map<String, dynamic> response = await authGetUser(APIEndpoints.user, authenticate: true);
    return UserModel.fromJson(response);
  }

  static Future<void> createUser(UserCreateModel userCreate) async {
    await APIWrapper.post(APIEndpoints.user, userCreate.toJson());
    await AuthApi.login(LoginModel(email: userCreate.email, password: userCreate.password));
  }
}
