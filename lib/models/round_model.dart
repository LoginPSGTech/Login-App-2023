class Round {
  final int roundNumber;
  final String roundName;
  final String roundDescription;

  Round({
    required this.roundNumber,
    required this.roundName,
    required this.roundDescription,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      roundNumber: json['roundNumber'],
      roundName: json['roundName'],
      roundDescription: json['roundDescription'],
    );
  }
}