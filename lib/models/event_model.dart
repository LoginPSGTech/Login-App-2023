import 'package:login/models/event_convenor_model.dart';
import 'package:login/models/round_model.dart';

class Event {
  final String eventId;
  final String eventName;
  final List<EventConvenor> eventConvenors;
  final String eventLogo;
  final String eventTagline;
  final String eventDescription;
  final List<String> eventRules;
  final List<Round> roundWiseDescription;
  final String teamSize;
  final String facultyAdvisor;
  final String expectedNoOfParticipants;

  Event({
    required this.eventId,
    required this.eventName,
    required this.eventConvenors,
    required this.eventLogo,
    required this.eventTagline,
    required this.eventDescription,
    required this.eventRules,
    required this.roundWiseDescription,
    required this.teamSize,
    required this.facultyAdvisor,
    required this.expectedNoOfParticipants,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final roundList =
        (json['roundWiseDescription'] as List<dynamic>).map((roundJson) => Round.fromJson(roundJson)).toList();

    final eventConvenorList = (json['eventConvenors'] as List<dynamic>)
        .map((eventConvenorJson) => EventConvenor.fromJson(eventConvenorJson))
        .toList();

    final rulesList = (json['eventRules'] as List).cast<String>();

    return Event(
      eventId: json['eventId'],
      eventName: json['eventName'],
      eventConvenors: eventConvenorList,
      eventLogo: json['eventLogo'],
      eventTagline: json['eventTagline'],
      eventDescription: json['eventDescription'],
      eventRules: rulesList,
      roundWiseDescription: roundList,
      teamSize: json['teamSize'],
      facultyAdvisor: json['facultyAdvisor'],
      expectedNoOfParticipants: json['expectedNoOfParticipants'],
    );
  }
}
