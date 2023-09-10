import 'package:flutter/material.dart';
import 'package:login/models/app_data_model.dart';
import 'package:login/models/day_schedule_model.dart';
import 'package:login/models/home_model.dart';

class AppDataProvider with ChangeNotifier {
  late AppData _appData;

  AppDataProvider() {
    _appData = AppData(
      home:Home(tagline:'',description: '',addeddescription: '',about: '',addedabout: '',events: []),
      mscEvents: [],
      mcaEvents: [],
      eventInstructions: [],
      day1Schedule: DaySchedule(date: '', schedule: []),
      day2Schedule: DaySchedule(date: '', schedule: []));
    // Initialize the _appData instance by loading data
    _loadData();
  }

  AppData get appData => _appData;

  // Load data and notify listeners when done
  Future<void> _loadData() async {
    _appData = await AppData.loadData();
    notifyListeners();
  }
}
