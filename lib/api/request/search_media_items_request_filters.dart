import 'package:photo_image/api/request/search_media_items_request_media_type_filter.dart';

class SearchMediaItemsRequestFilters {
  SearchMediaItemsRequestMediaTypeFilter? mediaTypeFilter;

  SearchMediaItemsRequestFilters(this.mediaTypeFilter);

  factory SearchMediaItemsRequestFilters.fromJson(Map<String, dynamic> json) =>
      SearchMediaItemsRequestFilters(
        json['mediaTypeFilter'] == null
            ? null
            : SearchMediaItemsRequestMediaTypeFilter.fromJson(
                json['mediaTypeFilter'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mediaTypeFilter': mediaTypeFilter?.toJson(),
      };
}
