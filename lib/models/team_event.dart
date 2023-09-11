import 'package:json_annotation/json_annotation.dart';
part 'team_event.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamEventModel {
  final String team_name;
  final String event;

  TeamEventModel({required this.team_name, required this.event});

  factory TeamEventModel.fromJson(Map<String, dynamic> json) => _$TeamEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamEventModelToJson(this);
}
