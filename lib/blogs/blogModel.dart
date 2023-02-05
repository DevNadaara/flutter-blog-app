// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    required this.cover,
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    this.tags,
    required this.user,
    this.likes,
  });

  Cover cover;
  String id;
  String title;
  String summary;
  String body;
  List<String>? tags;
  User user;
  List<dynamic>? likes;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        cover: Cover.fromJson(json["cover"]),
        id: json["_id"],
        title: json["title"],
        summary: json["summary"],
        body: json["body"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        user: User.fromJson(json["user"]),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cover": cover.toJson(),
        "_id": id,
        "title": title,
        "summary": summary,
        "body": body,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "user": user.toJson(),
        "likes": List<dynamic>.from(likes!.map((x) => x)),
      };
}

class Cover {
  Cover({
    required this.publicId,
    required this.url,
  });

  String publicId;
  String url;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        publicId: json["publicId"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "publicId": publicId,
        "url": url,
      };
}

class User {
  User({
    required this.profile,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Cover profile;
  String id;
  String name;
  String email;
  String password;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        profile: Cover.fromJson(json["profile"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
      };
}
