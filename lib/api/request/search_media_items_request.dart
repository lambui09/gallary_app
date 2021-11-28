import 'package:json_annotation/json_annotation.dart';
import 'package:photo_image/api/request/search_media_items_request_filters.dart';

@JsonSerializable()
class SearchMediaItemsRequest {
  String? albumId;
  int? pageSize;
  String? pageToken;
  SearchMediaItemsRequestFilters? filters;

  SearchMediaItemsRequest(
      this.albumId, this.pageSize, this.pageToken, this.filters);

  SearchMediaItemsRequest.albumId(this.albumId);

  factory SearchMediaItemsRequest.fromJson(Map<String, dynamic> json) =>
      SearchMediaItemsRequest(
        json['albumId'] as String?,
        json['pageSize'] as int?,
        json['pageToken'] as String?,
        json['filters'] == null
            ? null
            : SearchMediaItemsRequestFilters.fromJson(
                json['filters'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'albumId': albumId,
        'pageSize': pageSize,
        'pageToken': pageToken,
        'filters': filters?.toJson(),
      };
}
