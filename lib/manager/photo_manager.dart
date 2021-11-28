import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:photo_image/api/model/media.dart';
import 'package:photo_image/api/request/search_media_items_request.dart';
import 'package:photo_image/manager/google_photo_client.dart';

import '../api/model/album.dart';
import 'dart:async';

class PhotoManager {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'profile',
    'https://www.googleapis.com/auth/photoslibrary',
    'https://www.googleapis.com/auth/photoslibrary.sharing'
  ]);
  GoogleSignInAccount? _currentUser;

  GoogleSignInAccount? get user => _currentUser;
  GooglePhotoClient? _client;

  PhotoManager() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      _client?.dispose();

      var headers = account?.authHeaders;
      _client = headers == null ? null : GooglePhotoClient(headers, Client());
    });
  }

  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user == null) {
        // User could not be signed in
        print('User could not be signed in.');
        return false;
      }
      print('User signed in.');
      return true;
    }on Exception catch(e){
        print(e);
        return false;
    }
  }

  Future<List<Album>> getAlbums() {
    return _client?.listAlbums().then((value) => value.albums ?? [])?? Future.error(Exception("Client Null"));
  }

  Future<Media>? getMediaItem(Media media) {
    return _client?.getMediaItem(media.id);
  }

  Future<List<Media>>? getPhotosFromAlbum(Album? album) {
    return _client
        ?.searchMediaItems(SearchMediaItemsRequest(album?.id, 100, null, null))
        .then((value) =>
            value.mediaItems
                ?.where((element) =>
                    element.mimeType?.startsWith('image/') ?? false)
                .toList(growable: false) ??
            []);
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
  }

  static PhotoManager? instance = null;

  static PhotoManager getInstance(){
    instance ??= PhotoManager();
    return instance!;
  }
}
