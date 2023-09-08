import 'package:json_annotation/json_annotation.dart';
part 'auth.g.dart';

enum TokenType { access, refresh }

@JsonSerializable(explicitToJson: true)
class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterModel {
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

  RegisterModel(
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

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginResponseModel {
  String refresh;
  String access;

  LoginResponseModel({required this.refresh, required this.access});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
