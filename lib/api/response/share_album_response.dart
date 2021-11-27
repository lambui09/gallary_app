import '../model/share_info.dart';

class ShareAlbumResponse {
  ShareInfo? shareInfo;

  ShareAlbumResponse(this.shareInfo);

  factory ShareAlbumResponse.fromJson(Map<String, dynamic> json) =>
      ShareAlbumResponse(json['shareInfo'] == null
          ? null
          : ShareInfo.fromJson(json['shareInfo'] as Map<String, dynamic>));

  Map<String, dynamic> toJson(ShareAlbumResponse shareAlbumResponse) =>
      <String, dynamic>{'shareInfo': shareAlbumResponse.shareInfo};
}
