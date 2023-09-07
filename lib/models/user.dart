import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserEventModel {
  int id;
  String event;
  String user;

  UserEventModel({
    required this.id,
    required this.event,
    required this.user,
  });

  factory UserEventModel.fromJson(Map<String, dynamic> json) => _$UserEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserEventModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserTeamModel {
  int id;
  String team_id;
  String team_name;
  String event;
  String created_by;

  UserTeamModel({
    required this.id,
    required this.team_id,
    required this.team_name,
    required this.event,
    required this.created_by,
  });

  factory UserTeamModel.fromJson(Map<String, dynamic> json) => _$UserTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserTeamModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserModel {
  String userId;
  String email;
  String college;
  String code;
  String name;
  String gender;
  String phoneNumber;
  String rollNumber;
  String yearOfStudy;
  String isAccommodationRequired;
  String dietType;
  String degree;
  String stream;
  List<UserEventModel> events;
  List<UserTeamModel> teams;

  UserModel(
      {required this.userId,
      required this.email,
      required this.college,
      required this.code,
      required this.name,
      required this.gender,
      required this.phoneNumber,
      required this.rollNumber,
      required this.yearOfStudy,
      required this.isAccommodationRequired,
      required this.dietType,
      required this.degree,
      required this.stream,
      required this.events,
      required this.teams});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
