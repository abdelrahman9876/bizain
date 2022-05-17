// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileResponseModel profileFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
  ProfileResponseModel({
    this.result,
    this.message,
    this.name,
    this.image,
    this.specialization,
    this.bio,
    this.following,
    this.followedBy,
    this.videosCount,
    this.videos,
  });

  bool result;
  String message;
  String name;
  String image;
  String specialization;
  String bio;
  int following;
  int followedBy;
  int videosCount;
  List<String> videos;

  ProfileResponseModel copyWith({
    bool result,
    String message,
    String name,
    String image,
    String specialization,
    String bio,
    int following,
    int followedBy,
    int videosCount,
    List<String> videos,
  }) =>
      ProfileResponseModel(
        result: result ?? this.result,
        message: message ?? this.message,
        name: name ?? this.name,
        image: image ?? this.image,
        specialization: specialization ?? this.specialization,
        bio: bio ?? this.bio,
        following: following ?? this.following,
        followedBy: followedBy ?? this.followedBy,
        videosCount: videosCount ?? this.videosCount,
        videos: videos ?? this.videos,
      );

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    specialization: json["specialization"] == null ? null : json["specialization"],
    bio: json["bio"] == null ? null : json["bio"],
    following: json["following"] == null ? null : json["following"],
    followedBy: json["followed_by"] == null ? null : json["followed_by"],
    videosCount: json["videos_count"] == null ? null : json["videos_count"],
    videos: json["videos"] == null ? null : List<String>.from(json["videos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "specialization": specialization == null ? null : specialization,
    "bio": bio == null ? null : bio,
    "following": following == null ? null : following,
    "followed_by": followedBy == null ? null : followedBy,
    "videos_count": videosCount == null ? null : videosCount,
    "videos": videos == null ? null : List<dynamic>.from(videos.map((x) => x)),
  };
}
