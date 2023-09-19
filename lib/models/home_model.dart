import 'package:login/models/event_model.dart';

class Home {
  final String tagline;
  final String description;
  final String addeddescription;
  final String about;
  final String addedabout;
  final List<Event> events;
  final List<Items> programs;
  final List<Items> sponsors;

  Home(
      {required this.tagline,
      required this.description,
      required this.addeddescription,
      required this.about,
      required this.addedabout,
      required this.events,
      required this.programs,
      required this.sponsors});

  factory Home.fromJson(Map<String, dynamic> json) {
    final eventsList = (json['events'] as List<dynamic>).map((eventJson) => Event.fromJson(eventJson)).toList();
    final programsList = (json['programs'] as List<dynamic>).map((programJson) => Items.fromJson(programJson)).toList();
    final sponsorsList = (json['sponsors'] as List<dynamic>).map((programJson) => Items.fromJson(programJson)).toList();

    return Home(
        tagline: json['tagline'],
        description: json['description'],
        addeddescription: json['addedDescription'],
        about: json['about'],
        addedabout: json["addedAbout"],
        events: eventsList,
        programs: programsList,
        sponsors: sponsorsList);
  }
}

class Items {
  final String itemName;
  final String itemImage;

  Items({required this.itemName, required this.itemImage});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      itemName: json['name'],
      itemImage: json['image'],
    );
  }
}
