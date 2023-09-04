import 'package:login/models/event_model.dart';

class Home {
  final String tagline;
  final String description;
  final String about;
  final List<Event> events;

  Home({
    required this.tagline,
    required this.description,
    required this.about,
    required this.events,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    final eventsList = (json['events'] as List<dynamic>)
        .map((eventJson) => Event.fromJson(eventJson))
        .toList();

    return Home(
      tagline: json['tagline'],
      description: json['description'],
      about: json['about'],
      events: eventsList,
    );
  }
}