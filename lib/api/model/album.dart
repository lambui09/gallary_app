import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' show json;
//description: https://developers.google.com/photos/library/guides/manage-albums
class Album{
  String? id;
  String? title;
  String? productUrl;
  bool? isWriteable;
  String? coverPhotoBaseUrl;
  Album(this.id, this.title, this.isWriteable, this.productUrl, this.coverPhotoBaseUrl);
  Album.toCreate(this.title);
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      json['id'] as String?,
      json['title'] as String?,
      json['isWriteable'] as bool?,
      json['productUrl'] as String?,
      json['coverPhotoBaseUrl'] as String?,
    );
  }

  Map<String, dynamic> albumToJson(Album album) {
    return {
      'id': album.id,
      'title': album.title,
      'isWriteable': album.isWriteable,
      'productUrl': album.productUrl,
      'coverPhotoBaseUrl': album.coverPhotoBaseUrl,
    };
  }
}