class EventConvenor {
  final String eventConvenorName;
  final String eventConvenorPhone;
  final String eventConvenorRollNo;
  final String eventConvenorEmail;

  EventConvenor({
    required this.eventConvenorName,
    required this.eventConvenorPhone,
    required this.eventConvenorRollNo,
    required this.eventConvenorEmail
    });

    factory EventConvenor.fromJson(Map<String, dynamic> json) {
      return EventConvenor(
        eventConvenorName: json['eventConvenorName'],
        eventConvenorEmail: json['eventConvenorEmail'],
        eventConvenorPhone: json['eventConvenorPhone'],
        eventConvenorRollNo: json['eventConvenorRollNo']
      );
    }
}