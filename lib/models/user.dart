import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserEventModel {
  int? id;
  String event;
  String user;

  UserEventModel({
    this.id,
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
  String user_id;
  String email;
  String college;
  String code;
  String name;
  String gender;
  String phoneNumber;
  String rollNumber;
  String yearOfStudy;
  bool isAccommodationRequired;
  String dietType;
  String degree;
  String stream;
  List<UserEventModel> events;
  List<UserTeamModel> teams;

  UserModel(
      {required this.user_id,
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

@JsonSerializable(explicitToJson: true)
class UserCreateModel {
  String email;
  String password;
  String college;
  String code;
  String name;
  String gender;
  String phoneNumber;
  String rollNumber;
  String yearOfStudy;
  bool isAccommodationRequired;
  String dietType;
  String degree;
  String stream;
  String otp;

  UserCreateModel(
      {required this.email,
      required this.password,
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
      required this.otp});

  factory UserCreateModel.fromJson(Map<String, dynamic> json) => _$UserCreateModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserCreateModelToJson(this);
}
