import 'package:photo_image/api/model/Album.dart';

class ListSharedAlbumsResponse {
  String? nextPageToken;
  List<Album>? sharedListAlbums;
  ListSharedAlbumsResponse(this.sharedListAlbums, this.nextPageToken);

  factory ListSharedAlbumsResponse.fromJson(Map<String, dynamic> json) {
    return ListSharedAlbumsResponse(
        ((json['sharedAlbums'] as List<dynamic>?)
            ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
            .toList()),
        json['nextPageToken'] as String?);
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
