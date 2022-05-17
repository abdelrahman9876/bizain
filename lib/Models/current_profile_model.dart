// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    this.result,
    this.message,
    this.userId,
    this.name,
    this.occupation,
    this.bio,
    this.image,
  });

  bool result;
  String message;
  String userId;
  String name;
  dynamic occupation;
  dynamic bio;
  String image;

  UpdateProfileModel copyWith({
    bool result,
    String message,
    String userId,
    String name,
    dynamic occupation,
    dynamic bio,
    String image,
  }) =>
      UpdateProfileModel(
        result: result ?? this.result,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        occupation: occupation ?? this.occupation,
        bio: bio ?? this.bio,
        image: image ?? this.image,
      );

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    userId: json["user_id"] == null ? null : json["user_id"],
    name: json["name"] == null ? null : json["name"],
    occupation: json["occupation"],
    bio: json["bio"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "user_id": userId == null ? null : userId,
    "name": name == null ? null : name,
    "occupation": occupation,
    "bio": bio,
    "image": image == null ? null : image,
  };
}
