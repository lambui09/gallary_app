import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:photo_image/api/model/media.dart';
import 'package:photo_image/api/request/batch_create_media_items_request.dart';
import 'package:photo_image/api/request/join_shared_album_request.dart';
import 'package:photo_image/api/request/share_album_request.dart';
import 'package:photo_image/api/response/batch_create_media_items_response.dart';
import 'package:photo_image/api/response/join_shared_album_response.dart';
import 'package:photo_image/api/response/list_album_response.dart';

import '../api/model/Album.dart';
import '../api/request/create_album_request.dart';
import '../api/request/get_all_album_request.dart';
import '../api/request/search_media_items_request.dart';
import '../api/response/list_shared_albums_response.dart';
import '../api/response/search_media_items_response.dart';
import '../api/response/share_album_response.dart';

//https://betterprogramming.pub/the-minimum-guide-for-using-google-drive-api-with-flutter-9207e4cb05ba
//https://codelabs.developers.google.com/codelabs/google-photos-sharing#4
class GooglePhotoClient {
  final http.Client _clientL;
  final Future<Map<String, String>> _header;

  GooglePhotoClient(this._header, this._clientL);

  Future<Album> createAlbum(CreateAlbumRequest request) async {
    return http
        .post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/albums'),
      body: jsonEncode(request),
      headers: await _header,
    )
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }
        return Album.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<JoinSharedAlbumResponse> joinSharedAlbum(
      JoinSharedAlbumRequest request) async {
    return http
        .post(
            Uri.parse(
                'https://photoslibrary.googleapis.com/v1/sharedAlbums:join'),
            headers: await _header,
            body: jsonEncode(request))
        .then((Response response) {
      if (response.statusCode != 200) {
        print(response.reasonPhrase);
        print(response.body);
      }

      return JoinSharedAlbumResponse.fromJson(jsonDecode(response.body));
    });
  }

  Future<ShareAlbumResponse> shareAlbum(ShareAlbumRequest request) async {
    return http
        .post(
            Uri.parse(
                'https://photoslibrary.googleapis.com/v1/albums/${request.albumId}:share'),
            headers: await _header)
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }

        return ShareAlbumResponse.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<Album> getAlbum(GetAllAlbumsRequest request) async {
    return http
        .get(
            Uri.parse(
                'https://photoslibrary.googleapis.com/v1/albums/${request.albumId}'),
            headers: await _header)
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }

        return Album.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<ListAlbumsResponse> listAlbums() async {
    return http
        .get(
            Uri.parse('https://photoslibrary.googleapis.com/v1/albums?'
                'excludeNonAppCreatedData=false&pageSize=50'),
            headers: await _header)
        .then(
      (Response response) {
        if (response.statusCode == 200) {
          print('respone listAlbums' + response.body);
        } else {
          print('Error listAlbums ' + response.statusCode.toString());
        }
        return ListAlbumsResponse.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<ListSharedAlbumsResponse> listSharedAlbums() async {
    return http
        .get(
            Uri.parse('https://photoslibrary.googleapis.com/v1/sharedAlbums?'
                'pageSize=50&excludeNonAppCreatedData=true'),
            headers: await _header)
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }

        print(response.body);

        return ListSharedAlbumsResponse.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<String> uploadMediaItem(File image) async {
    // Get the filename of the image
    final String filename = path.basename(image.path);
    // Set up the headers required for this request.
    final Map<String, String> headers = <String, String>{};
    headers.addAll(await _header);
    headers['Content-type'] = 'application/octet-stream';
    headers['X-Goog-Upload-Protocol'] = 'raw';
    headers['X-Goog-Upload-File-Name'] = filename;
    // Make the HTTP request to upload the image. The file is sent in the body.
    return http
        .post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/uploads'),
      body: image.readAsBytesSync(),
      headers: await _header,
    )
        .then((Response response) {
      if (response.statusCode != 200) {
        print(response.reasonPhrase);
        print(response.body);
      }
      return response.body;
    });
  }

  Future<SearchMediaItemsResponse> searchMediaItems(
      SearchMediaItemsRequest request) async {
    return http
        .post(
      Uri.parse('https://photoslibrary.googleapis.com/v1/mediaItems:search'),
      body: jsonEncode(request),
      headers: await _header,
    )
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }
        print(response.body);

        return SearchMediaItemsResponse.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<Media> getMediaItem(String id) async {
    return http
        .get(
      Uri.parse('https://photoslibrary.googleapis.com/v1/mediaItems/$id'),
      headers: await _header,
    )
        .then(
      (Response response) {
        if (response.statusCode != 200) {
          print(response.reasonPhrase);
          print(response.body);
        }
        return Media.fromJson(jsonDecode(response.body));
      },
    );
  }

  Future<BatchCreateMediaItemsResponse> batchCreateMediaItems(
      BatchCreateMediaItemsRequest request) async {
    print(request.toJson(request));
    return http
        .post(
            Uri.parse(
                'https://photoslibrary.googleapis.com/v1/mediaItems:batchCreate'),
            body: jsonEncode(request),
            headers: await _header)
        .then((Response response) {
      if (response.statusCode != 200) {
        print(response.reasonPhrase);
        print(response.body);
      }

      return BatchCreateMediaItemsResponse.fromJson(jsonDecode(response.body));
    });
  }

  void dispose() {}
}
