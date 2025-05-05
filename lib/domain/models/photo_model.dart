// To parse this JSON data, do the following:
//
// final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

List<PhotosModel> photosModelFromJson(final String str) =>
    List<PhotosModel>.from(
      json.decode(str).map((final x) => PhotosModel.fromJson(x)),
    );

String photosModelToJson(final List<PhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((final x) => x.toJson())));

class PhotosModel {
  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotosModel.fromJson(final Map<String, dynamic> json) => PhotosModel(
    albumId: json['albumId'],
    id: json['id'],
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl'],
  );

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Map<String, dynamic> toJson() => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };
}
