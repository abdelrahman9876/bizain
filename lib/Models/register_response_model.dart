// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
    this.result,
    this.message,
    this.userId,
  });

  bool result;
  String message;
  int userId;

  RegisterResponseModel copyWith({
    bool result,
    String message,
    int userId,
  }) =>
      RegisterResponseModel(
        result: result ?? this.result,
        message: message ?? this.message,
        userId: userId ?? this.userId,
      );

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    userId: json["user_id"] == null ? null : json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "user_id": userId == null ? null : userId,
  };
}
