import 'package:login/models/event_model.dart';

class Home {
  final String tagline;
  final String description;
  final String addeddescription;
  final String about;
  final String addedabout;
  final List<Event> events;

  Home({
    required this.tagline,
    required this.description,
    required this.addeddescription,
    required this.about,
    required this.addedabout,
    required this.events,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    final eventsList = (json['events'] as List<dynamic>).map((eventJson) => Event.fromJson(eventJson)).toList();

    return Home(
      tagline: json['tagline'],
      description: json['description'],
      addeddescription: json['addedDescription'],
      about: json['about'],
      addedabout: json["addedAbout"],
      events: eventsList,
    );
  }
}
