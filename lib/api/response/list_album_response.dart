import 'package:json_annotation/json_annotation.dart';

import '../model/album.dart';

@JsonSerializable()
class ListAlbumsResponse {
  List<Album>? albums;
  String? nextPageToken;

  ListAlbumsResponse(this.albums, this.nextPageToken);

  factory ListAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      ListAlbumsResponse(
        (json['albums'] as List<dynamic>?)
            ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
            .toList(),
        json['nextPageToken'] as String?,
      );

  Map<String, dynamic> toJson(ListAlbumsResponse listAlbumsResponse) =>
      <String, dynamic>{
        'albums': listAlbumsResponse.albums,
        'nextPageToken': listAlbumsResponse.nextPageToken,
      };
}
