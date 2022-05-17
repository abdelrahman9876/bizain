// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginStudentResponse studentFromJson(String str) => LoginStudentResponse.fromJson(json.decode(str));

String studentToJson(LoginStudentResponse data) => json.encode(data.toJson());

class LoginStudentResponse {
  LoginStudentResponse({
    this.result,
    this.userType,
    this.message,
    this.userId,
    this.phone,
    this.email,
    this.name,
    this.accessToken,
  });

  bool result;
  String userType;
  String message;
  int userId;
  String phone;
  String email;
  String name;
  String accessToken;

  LoginStudentResponse copyWith({
    bool result,
    String userType,
    String message,
    int userId,
    String phone,
    String email,
    String name,
    String accessToken,
  }) =>
      LoginStudentResponse(
        result: result ?? this.result,
        userType: userType ?? this.userType,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        name: name ?? this.name,
        accessToken: accessToken ?? this.accessToken,
      );

  factory LoginStudentResponse.fromJson(Map<String, dynamic> json) => LoginStudentResponse(
    result: json["result"] == null ? null : json["result"],
    userType: json["user_type"] == null ? null : json["user_type"],
    message: json["message"] == null ? null : json["message"],
    userId: json["user_id"] == null ? null : json["user_id"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "user_type": userType == null ? null : userType,
    "message": message == null ? null : message,
    "user_id": userId == null ? null : userId,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "access_token": accessToken == null ? null : accessToken,
  };
}
