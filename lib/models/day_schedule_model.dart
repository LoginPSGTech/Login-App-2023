class EventSchedule {
  final String eventName;
  final String venue;
  final String endTime;

  EventSchedule({
    required this.eventName,
    required this.venue,
    required this.endTime,
  });

  factory EventSchedule.fromJson(Map<String, dynamic> json) {
    return EventSchedule(
      eventName: json['eventName'],
      venue: json['venue'],
      endTime: json['endTime'],
    );
  }
}

class Schedule {
  final String startTime;
  final List<EventSchedule> events;

  Schedule({
    required this.startTime,
    required this.events,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    var eventList = json['events'] as List;
    List<EventSchedule> events = eventList.map((eventJson) => EventSchedule.fromJson(eventJson)).toList();

    return Schedule(
      startTime: json['startTime'],
      events: events,
    );
  }
}

class DaySchedule {
  final String date;
  final List<Schedule> schedule;

  DaySchedule({
    required this.date,
    required this.schedule,
  });

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    var scheduleList = json['schedule'] as List;
    List<Schedule> schedule = scheduleList.map((scheduleJson) => Schedule.fromJson(scheduleJson)).toList();

    return DaySchedule(
      date: json['date'],
      schedule: schedule,
    );
  }
}
