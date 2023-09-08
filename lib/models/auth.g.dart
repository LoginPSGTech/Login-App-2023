// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) => RegisterModel(
      email: json['email'] as String,
      password: json['password'] as String,
      college: json['college'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      phoneNumber: json['phoneNumber'] as String,
      rollNumber: json['rollNumber'] as String,
      yearOfStudy: json['yearOfStudy'] as String,
      isAccommodationRequired: json['isAccommodationRequired'] as bool,
      dietType: json['dietType'] as String,
      degree: json['degree'] as String,
      stream: json['stream'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
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
      'otp': instance.otp,
    };

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) => LoginResponseModel(
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
