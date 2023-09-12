class EventInstructions {
  final String stepName;
  final List<String> steps;
  // "registrationMessage": "Congratulations! You're all set for the event. For any questions or issues, reach out to our support team."

  EventInstructions({required this.stepName, required this.steps});

  factory EventInstructions.fromJson(Map<String, dynamic> json) {
    return EventInstructions(
      stepName: json['stepName'] as String,
      steps: List<String>.from(json['steps']),
    );
  }
}
