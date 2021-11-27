import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SharedAlbumOptions {
  bool? isCollaborative;
  bool? isCommentable;

  SharedAlbumOptions(this.isCollaborative, this.isCommentable);

  SharedAlbumOptions.fullCollaboration() : this(true, true);

  factory SharedAlbumOptions.fromJson(Map<String, dynamic> json) =>
      SharedAlbumOptions(
          json['isCollaborative'] as bool, json['isCommentable'] as bool);

  Map<String, dynamic> toJson(SharedAlbumOptions sharedAlbumOptions) =>
      <String, dynamic>{
        'isCollaborative': sharedAlbumOptions.isCollaborative,
        'isCommentable': sharedAlbumOptions.isCommentable
      };
}
