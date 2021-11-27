import 'package:photo_image/api/model/Album.dart';

class JoinSharedAlbumResponse {
  Album? album;

  JoinSharedAlbumResponse(this.album);

  factory JoinSharedAlbumResponse.fromJson(Map<String, dynamic> json) {
    return JoinSharedAlbumResponse(
      json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(
          JoinSharedAlbumResponse joinSharedAlbumResponse) =>
      <String, dynamic>{
        'album': joinSharedAlbumResponse.album,
      };
}
