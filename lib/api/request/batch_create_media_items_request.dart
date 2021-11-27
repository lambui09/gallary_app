import 'package:json_annotation/json_annotation.dart';

import '../model/new_media_item.dart';

@JsonSerializable()
class BatchCreateMediaItemsRequest {
  String? albumId;
  List<NewMediaItem>? newMediaItems;
  AlbumPosition? albumPosition;

  BatchCreateMediaItemsRequest(
      this.albumId, this.newMediaItems, this.albumPosition);

  static BatchCreateMediaItemsRequest inAlbum(String uploadToken, String albumId, String description) {
    return BatchCreateMediaItemsRequest(
        albumId,
        <NewMediaItem>[NewMediaItem.simple(uploadToken, description)],
        AlbumPosition.lastInAlbum());
  }

  factory BatchCreateMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      BatchCreateMediaItemsRequest(
          json['albumId'] as String,
          (json['newMediaItems'] as List<dynamic>)
              .map((e) => NewMediaItem.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['albumPosition'] == null
              ? null
              : AlbumPosition.fromJson(
              json['albumPosition'] as Map<String, dynamic>));

  Map<String, dynamic> toJson(
          BatchCreateMediaItemsRequest batchCreateMediaItemsRequest) =>
      <String, dynamic>{
        'albumId': batchCreateMediaItemsRequest.albumId,
        'newMediaItems': batchCreateMediaItemsRequest.newMediaItems,
        'albumPosition': batchCreateMediaItemsRequest.albumPosition
      };
}

@JsonSerializable()
class SimpleMediaItem {
  String uploadToken;

  SimpleMediaItem(this.uploadToken);

  factory SimpleMediaItem.fromJson(Map<String, dynamic> json) =>
      SimpleMediaItem(
        json['uploadToken'] as String,
      );

  Map<String, dynamic> toJson(SimpleMediaItem simpleMediaItem) =>
      <String, dynamic>{
        'uploadToken': simpleMediaItem.uploadToken,
      };
}

@JsonSerializable()
class AlbumPosition {
  String? relativeMediaItemId;
  String? relativeEnrichmentItemId;
  positionType? position;

  AlbumPosition(
      this.relativeMediaItemId, this.relativeEnrichmentItemId, this.position);

  AlbumPosition.absolute(this.position);

  factory AlbumPosition.fromJson(Map<String, dynamic> json) => AlbumPosition(
        json['relativeMediaItemId'] as String?,
        json['relativeEnrichmentItemId'] as String?,
        $enumDecode(positionTypeEnumMap, json['position']),
      );

  Map<String, dynamic> toJson(AlbumPosition albumPosition) => <String, dynamic>{
        'relativeMediaItemId': albumPosition.relativeMediaItemId,
        'relativeEnrichmentItemId': albumPosition.relativeEnrichmentItemId,
        'position': positionTypeEnumMap[albumPosition.position],
      };

  static AlbumPosition lastInAlbum() =>
      AlbumPosition.absolute(positionType.LAST_IN_ALBUM);
}

enum positionType {
  POSITION_TYPE_UNSPECIFIED,
  FIRST_IN_ALBUM,
  LAST_IN_ALBUM,
  AFTER_MEDIA_ITEM,
  AFTER_ENRICHMENT_ITEM
}

const positionTypeEnumMap = {
  positionType.POSITION_TYPE_UNSPECIFIED: 'POSITION_TYPE_UNSPECIFIED',
  positionType.FIRST_IN_ALBUM: 'FIRST_IN_ALBUM',
  positionType.LAST_IN_ALBUM: 'LAST_IN_ALBUM',
  positionType.AFTER_MEDIA_ITEM: 'AFTER_MEDIA_ITEM',
  positionType.AFTER_ENRICHMENT_ITEM: 'AFTER_ENRICHMENT_ITEM',
};
