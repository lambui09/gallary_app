import 'package:photo_image/api/model/media.dart';

class SearchMediaItemsResponse {
  List<Media>? mediaItems;
  String? nextPageToken;

  SearchMediaItemsResponse(this.mediaItems, this.nextPageToken);

  factory SearchMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      SearchMediaItemsResponse(
        (json['mediaItems'] as List<dynamic>?)
            ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
            .toList(),
        json['nextPageToken'] as String?,
      );

  Map<String, dynamic> toJson(
          SearchMediaItemsResponse searchMediaItemsResponse) =>
      <String, dynamic>{
        'mediaItems': searchMediaItemsResponse.mediaItems,
        'nextPageToken': searchMediaItemsResponse.nextPageToken,
      };
}
