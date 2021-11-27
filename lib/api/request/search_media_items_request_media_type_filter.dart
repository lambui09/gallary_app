import 'package:json_annotation/json_annotation.dart';

class SearchMediaItemsRequestMediaTypeFilter {
  List<SearchMediaItemsRequestMediaType>? mediaTypes;

  SearchMediaItemsRequestMediaTypeFilter(this.mediaTypes);

  factory SearchMediaItemsRequestMediaTypeFilter.fromJson(
          Map<String, dynamic> json) =>
      SearchMediaItemsRequestMediaTypeFilter(
        (json['mediaTypes'] as List<dynamic>?)
            ?.map(
                (e) => $enumDecode(searchMediaItemsRequestMediaTypeEnumMap, e))
            .toList(),
      );

  Map<String, dynamic> toJson(
          SearchMediaItemsRequestMediaTypeFilter
              searchMediaItemsRequestMediaTypeFilter) =>
      <String, dynamic>{
        'mediaTypes': searchMediaItemsRequestMediaTypeFilter.mediaTypes
            ?.map((e) => searchMediaItemsRequestMediaTypeEnumMap[e])
            .toList(),
      };
}

enum SearchMediaItemsRequestMediaType {
  ALL_MEDIA,
  VIDEO_lAll,
  PHOTO,
}

const searchMediaItemsRequestMediaTypeEnumMap = {
  SearchMediaItemsRequestMediaType.ALL_MEDIA: 'ALL_MEDIA',
  SearchMediaItemsRequestMediaType.VIDEO_lAll: 'VIDEO_lAll',
  SearchMediaItemsRequestMediaType.PHOTO: 'PHOTO',
};
