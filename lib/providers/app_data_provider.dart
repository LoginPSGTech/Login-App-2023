import 'package:flutter/material.dart';
import 'package:login/models/app_data_model.dart';
import 'package:login/models/user.dart';

class AppDataProvider with ChangeNotifier {
  late AppData _appData;
  late UserModel _user;

  AppData get appData => _appData;

  void saveAppData(AppData appData) {
    _appData = appData;
    notifyListeners();
  }

  UserModel get user => _user;

  void saveUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
