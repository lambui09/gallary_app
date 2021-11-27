import 'package:json_annotation/json_annotation.dart';

import '../model/album.dart';

@JsonSerializable()
class CreateAlbumRequest {
  Album? album;

  CreateAlbumRequest(this.album);

  CreateAlbumRequest.fromTitle(String title) {
    album = Album.toCreate(title);
  }

  factory CreateAlbumRequest.fromJson(Map<String, dynamic> json) =>
      CreateAlbumRequest(json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>));

  Map<String, dynamic> toJson(CreateAlbumRequest createAlbumRequest) =>
      <String, dynamic>{'album': createAlbumRequest.album};
}
