// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTeamModel _$CreateTeamModelFromJson(Map<String, dynamic> json) => CreateTeamModel(
      team_name: json['team_name'] as String,
      event: json['event'] as String,
    );

Map<String, dynamic> _$CreateTeamModelToJson(CreateTeamModel instance) => <String, dynamic>{
      'team_name': instance.team_name,
      'event': instance.event,
    };

JoinTeamModel _$JoinTeamModelFromJson(Map<String, dynamic> json) => JoinTeamModel(
      event: json['event'] as String,
      user: json['user'] as String,
      team_id: json['team_id'] as String,
    );

Map<String, dynamic> _$JoinTeamModelToJson(JoinTeamModel instance) => <String, dynamic>{
      'event': instance.event,
      'user': instance.user,
      'team_id': instance.team_id,
    };
