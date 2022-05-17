// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StudentProfileResponse studentProfileFromJson(String str) => StudentProfileResponse.fromJson(json.decode(str));

String studentProfileToJson(StudentProfileResponse data) => json.encode(data.toJson());

class StudentProfileResponse {
  StudentProfileResponse({
    this.result,
    this.message,
    this.name,
    this.image,
    this.specialization,
    this.bio,
    this.following,
    this.followedBy,
  });

  bool result;
  String message;
  String name;
  String image;
  dynamic specialization;
  dynamic bio;
  int following;
  int followedBy;

  StudentProfileResponse copyWith({
    bool result,
    String message,
    String name,
    String image,
    dynamic specialization,
    dynamic bio,
    int following,
    int followedBy,
  }) =>
      StudentProfileResponse(
        result: result ?? this.result,
        message: message ?? this.message,
        name: name ?? this.name,
        image: image ?? this.image,
        specialization: specialization ?? this.specialization,
        bio: bio ?? this.bio,
        following: following ?? this.following,
        followedBy: followedBy ?? this.followedBy,
      );

  factory StudentProfileResponse.fromJson(Map<String, dynamic> json) => StudentProfileResponse(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    specialization: json["specialization"],
    bio: json["bio"],
    following: json["following"] == null ? null : json["following"],
    followedBy: json["followed_by"] == null ? null : json["followed_by"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "specialization": specialization,
    "bio": bio,
    "following": following == null ? null : following,
    "followed_by": followedBy == null ? null : followedBy,
  };
}
