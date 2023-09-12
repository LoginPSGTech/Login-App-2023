import 'package:login/api/api.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/auth.dart';
import 'package:login/models/user.dart';

import 'endpoints.dart';

class UserApi {
  static Future<UserModel> getUser() async {
    Function authGetUser = await AuthApi.payloadLessAuth(ApiWrapper.get);
    Map<String, dynamic> response = await authGetUser(ApiEndpoints.user, authenticate: true);
    return UserModel.fromJson(response);
  }

  static Future<void> createUser(UserCreateModel userCreate) async {
    await ApiWrapper.post(ApiEndpoints.user, userCreate.toJson());
    await AuthApi.login(LoginModel(email: userCreate.email, password: userCreate.password));
  }

  static Future<void> registerEvent(UserEventModel userEvent) async {
    Function authRegisterEvent = await AuthApi.payloadAuth(ApiWrapper.post);
    await authRegisterEvent(ApiEndpoints.registerEvent, userEvent.toJson(), authenticate: true);
  }
}
