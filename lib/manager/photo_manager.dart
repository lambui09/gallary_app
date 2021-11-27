import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:photo_image/manager/google_photo_client.dart';

import '../api/model/album.dart';
import '../api/request/create_album_request.dart';
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
    final GoogleSignInAccount? user = await _googleSignIn.signIn();

    if (user == null) {
      // User could not be signed in
      print('User could not be signed in.');
      return false;
    }
    print('User signed in.');
    return true;
  }
  Future<List<Album>> getAlbums() =>
      _client?.then((c) => c.listAlbums().then((res) => res.albums ?? []));


  Future<void> signOut() async {
    await _googleSignIn.disconnect();
  }
}
