import 'package:json_annotation/json_annotation.dart';
part 'token.g.dart';

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
class LoginResponseModel {
  String refresh;
  String access;

  LoginResponseModel({required this.refresh, required this.access});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
