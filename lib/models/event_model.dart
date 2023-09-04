import 'package:login/models/round_model.dart';

class Event {
  final String eventName;
  final String eventConvenorName;
  final String eventConvenorPhone;
  final String eventConvenorRollNo;
  final String eventConvenorEmail;
  final String eventLogo;
  final String eventTagline;
  final String eventDescription;
  final List<Round> roundWiseDescription;
  final String teamSize;
  final String facultyAdvisor;
  final String expectedNoOfParticipants;

  Event({
    required this.eventName,
    required this.eventConvenorName,
    required this.eventConvenorPhone,
    required this.eventConvenorRollNo,
    required this.eventConvenorEmail,
    required this.eventLogo,
    required this.eventTagline,
    required this.eventDescription,
    required this.roundWiseDescription,
    required this.teamSize,
    required this.facultyAdvisor,
    required this.expectedNoOfParticipants,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final roundList = (json['roundWiseDescription'] as List<dynamic>)
        .map((roundJson) => Round.fromJson(roundJson))
        .toList();

    return Event(
      eventName: json['eventName'],
      eventConvenorName: json['eventConvenorName'],
      eventConvenorPhone: json['eventConvenorPhone'],
      eventConvenorRollNo: json['eventConvenorRollNo'],
      eventConvenorEmail: json['eventConvenorEmail'],
      eventLogo: json['eventLogo'],
      eventTagline: json['eventTagline'],
      eventDescription: json['eventDescription'],
      roundWiseDescription: roundList,
      teamSize: json['teamSize'],
      facultyAdvisor: json['facultyAdvisor'],
      expectedNoOfParticipants: json['expectedNoOfParticipants'],
    );
  }
}