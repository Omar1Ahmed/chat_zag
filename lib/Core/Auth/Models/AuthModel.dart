// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(Map<String, dynamic> str) => AuthModel.fromJson(str);

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  int? code;
  String? message;
  String? token;

  AuthModel({
    this.code,
    this.message,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    code: json["code"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "token": token,
  };
}
