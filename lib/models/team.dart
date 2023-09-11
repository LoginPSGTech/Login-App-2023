import 'package:json_annotation/json_annotation.dart';
part 'team.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTeamModel {
  final String team_name;
  final String event;

  CreateTeamModel({required this.team_name, required this.event});

  factory CreateTeamModel.fromJson(Map<String, dynamic> json) => _$CreateTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTeamModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JoinTeamModel {
  final String event;
  final String user;
  final String team_id;

  JoinTeamModel({required this.event, required this.user, required this.team_id});

  factory JoinTeamModel.fromJson(Map<String, dynamic> json) => _$JoinTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$JoinTeamModelToJson(this);
}
