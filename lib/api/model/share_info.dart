import 'package:json_annotation/json_annotation.dart';
import 'package:photo_image/api/model/shared_album_options.dart';

@JsonSerializable()
class ShareInfo {
  SharedAlbumOptions? sharedAlbumOptions;
  String? shareableUrl;
  String? shareToken;
  bool? isJoined;

  ShareInfo(this.sharedAlbumOptions, this.shareableUrl, this.shareToken,
      this.isJoined);

  factory ShareInfo.fromJson(Map<String, dynamic> json) => ShareInfo(
      json['sharedAlbumOptions'] == null
          ? null
          : SharedAlbumOptions.fromJson(
              json['sharedAlbumOptions'] as Map<String, dynamic>),
      json['shareableUrl'] as String,
      json['shareToken'] as String,
      json['isJoined'] as bool);
}
