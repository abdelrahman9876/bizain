// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ContentResponseModel contentFromJson(String str) => ContentResponseModel.fromJson(json.decode(str));

String contentToJson(ContentResponseModel data) => json.encode(data.toJson());

class ContentResponseModel {
  ContentResponseModel({
     this.result,
     this.message,
     this.userId,
     this.videos,
  });
  bool result;
  String message;
  int userId;
  List<String> videos;

  factory ContentResponseModel.fromJson(Map<String, dynamic> json) => ContentResponseModel(
    result: json["result"],
    message: json["message"],
    userId:json["user_id"]==null?0: int.tryParse( json["user_id"].toString()),
    videos: List<String>.from(json["videos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user_id": userId,
    "videos": List<dynamic>.from(videos.map((x) => x)),
  };
}
