class JoinSharedAlbumRequest {
  String? shareToken;

  JoinSharedAlbumRequest(this.shareToken);

  factory JoinSharedAlbumRequest.fromJson(Map<String, dynamic> json) =>
      JoinSharedAlbumRequest(json['shareToken'] as String);

  Map<String, dynamic> toJson(JoinSharedAlbumRequest joinSharedAlbumRequest) =>
      <String, dynamic>{'shareToken': joinSharedAlbumRequest.shareToken};
}
