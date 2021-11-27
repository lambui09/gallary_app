import 'package:json_annotation/json_annotation.dart';

import '../request/batch_create_media_items_request.dart';

@JsonSerializable()
class NewMediaItem {
  SimpleMediaItem? simpleMediaItem;
  String? description;

  NewMediaItem(this.description, this.simpleMediaItem);

  NewMediaItem.simple(String uploadToken, this.description)
      : simpleMediaItem = SimpleMediaItem(uploadToken);

  factory NewMediaItem.fromJson(Map<String, dynamic> json) => NewMediaItem(
        json['description'] as String?,
        json['simpleMediaItem'] == null
            ? null
            : SimpleMediaItem.fromJson(
                json['simpleMediaItem'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson(NewMediaItem item) => <String, dynamic>{
        'description': item.description,
        'simpleMediaItem': item.simpleMediaItem,
      };
}
