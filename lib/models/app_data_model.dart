import 'package:login/models/event_instructions.dart';
import 'package:login/models/home_model.dart';
import 'package:login/models/event_model.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AppData {
  final Home home;
  final List<Event> mscEvents;
  final List<Event> mcaEvents;
  final List<EventInstructions> eventInstructions;

  AppData(
      {required this.home,
      required this.mscEvents,
      required this.mcaEvents,
      required this.eventInstructions});

  factory AppData.fromJson(Map<String, dynamic> json) {

    final home = Home.fromJson(json['home']);

    final mscEvents = (json['mscEvents'] as List<dynamic>)
        .map((eventJson) => Event.fromJson(eventJson))
        .toList();
    final mcaEvents = (json['mcaEvents'] as List<dynamic>)
        .map((eventJson) => Event.fromJson(eventJson))
        .toList();

    final List<EventInstructions> eventInstructions = (json['eventInstructions'] as List)
      .map((e) => EventInstructions.fromJson(e as Map<String, dynamic>))
      .toList();

    return AppData(
        home: home,
        mscEvents: mscEvents,
        mcaEvents: mcaEvents,
        eventInstructions: eventInstructions);
  }

  static Future<AppData> loadData() async {
    try {
      // Load JSON data from an asset file
      final String jsonData =
          await rootBundle.loadString('assets/json/LoginApp.json');

      // Parse JSON into a Map
      final Map<String, dynamic> jsonMap = json.decode(jsonData);

      // Create an AppData instance from the parsed JSON
      final AppData appData = AppData.fromJson(jsonMap);

      return appData;
    } catch (error) {
      // Handle any errors that occur during data loading
      // print('Error loading data: $error');
      rethrow; // Rethrow the error to handle it at a higher level
    }
  }
}
