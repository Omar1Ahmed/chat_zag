// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(Map<String, dynamic> str) => ErrorModel.fromJson(str);

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  String? message;
  String? error;

  ErrorModel({
    this.message,
    this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
  };
}
