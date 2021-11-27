import 'package:json_annotation/json_annotation.dart';

//https://developers.google.com/photos/library/guides/access-media-items
@JsonSerializable()
class Media {
  String id;
  String? description;
  String? productUrl;
  String? baseUrl;
  String? mimeType;
  String? filename;

  Media(this.id, this.description, this.productUrl, this.baseUrl, this.mimeType,
      this.filename);

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      json['id'] as String,
      json['description'] as String?,
      json['productUrl'] as String?,
      json['baseUrl'] as String?,
      json['mimeType'] as String?,
      json['filename'] as String?,
    );
  }

  Map<String, dynamic> mediaToJson(Media media) {
    return {
      'id': media.id,
      'description': media.description,
      'productUrl': media.productUrl,
      'baseUrl': media.baseUrl,
      'mimeType': media.mimeType,
      'filename': media.filename,
    };
  }
}
