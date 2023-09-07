// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEventModel _$UserEventModelFromJson(Map<String, dynamic> json) => UserEventModel(
      id: json['id'] as int,
      event: json['event'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$UserEventModelToJson(UserEventModel instance) => <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'user': instance.user,
    };

UserTeamModel _$UserTeamModelFromJson(Map<String, dynamic> json) => UserTeamModel(
      id: json['id'] as int,
      team_id: json['team_id'] as String,
      team_name: json['team_name'] as String,
      event: json['event'] as String,
      created_by: json['created_by'] as String,
    );

Map<String, dynamic> _$UserTeamModelToJson(UserTeamModel instance) => <String, dynamic>{
      'id': instance.id,
      'team_id': instance.team_id,
      'team_name': instance.team_name,
      'event': instance.event,
      'created_by': instance.created_by,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      college: json['college'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      phoneNumber: json['phoneNumber'] as String,
      rollNumber: json['rollNumber'] as String,
      yearOfStudy: json['yearOfStudy'] as String,
      isAccommodationRequired: json['isAccommodationRequired'] as String,
      dietType: json['dietType'] as String,
      degree: json['degree'] as String,
      stream: json['stream'] as String,
      events: (json['events'] as List<dynamic>).map((e) => UserEventModel.fromJson(e as Map<String, dynamic>)).toList(),
      teams: (json['teams'] as List<dynamic>).map((e) => UserTeamModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'college': instance.college,
      'code': instance.code,
      'name': instance.name,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'rollNumber': instance.rollNumber,
      'yearOfStudy': instance.yearOfStudy,
      'isAccommodationRequired': instance.isAccommodationRequired,
      'dietType': instance.dietType,
      'degree': instance.degree,
      'stream': instance.stream,
      'events': instance.events.map((e) => e.toJson()).toList(),
      'teams': instance.teams.map((e) => e.toJson()).toList(),
    };
