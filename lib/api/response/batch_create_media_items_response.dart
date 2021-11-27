import 'package:json_annotation/json_annotation.dart';
import 'package:photo_image/api/model/media.dart';

@JsonSerializable()
class BatchCreateMediaItemsResponse {
  List<NewMediaItemResult>? newMediaItemResults;

  BatchCreateMediaItemsResponse(this.newMediaItemResults);

  factory BatchCreateMediaItemsResponse.fromJson(Map<String, dynamic> json) =>
      BatchCreateMediaItemsResponse(
        (json['newMediaItemResults'] as List<dynamic>?)
            ?.map((e) => NewMediaItemResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson(
          BatchCreateMediaItemsResponse batchCreateMediaItemsResponse) =>
      <String, dynamic>{
        'newMediaItemResults':
            batchCreateMediaItemsResponse.newMediaItemResults,
      };
}

@JsonSerializable()
class NewMediaItemResult {
  String uploadToken;
  Media? mediaItem;

  NewMediaItemResult(this.uploadToken, this.mediaItem);

  factory NewMediaItemResult.fromJson(Map<String, dynamic> json) =>
      NewMediaItemResult(
        json['uploadToken'] as String,
        json['mediaItem'] == null
            ? null
            : Media.fromJson(json['mediaItem'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson(NewMediaItemResult newMediaItemResult) =>
      <String, dynamic>{
        'uploadToken': newMediaItemResult.uploadToken,
        'mediaItem': newMediaItemResult.mediaItem,
      };
}
