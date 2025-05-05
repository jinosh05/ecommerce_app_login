// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

List<PostsModel> postsModelFromJson(final String str) => List<PostsModel>.from(
  json.decode(str).map((final x) => PostsModel.fromJson(x)),
);

String postsModelToJson(final List<PostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((final x) => x.toJson())));

class PostsModel {
  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(final Map<String, dynamic> json) => PostsModel(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );
  int userId;
  int id;
  String title;
  String body;

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };
}
