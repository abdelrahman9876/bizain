// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse loginFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
     this.result,
     this.message,
     this.userId,
     this.phone,
     this.email,
     this.name,
     this.accessToken,
  });

  bool result;
  String message;
  int userId;
  String phone;
  String email;
  String name;
  String accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    result: json["result"],
    message: json["message"],
    userId: json["user_id"],
    phone: json["phone"],
    email: json["email"],
    name: json["name"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user_id": userId,
    "phone": phone,
    "email": email,
    "name": name,
    "access_token": accessToken,
  };
}
