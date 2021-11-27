import 'package:http/http.dart' as http;

//https://betterprogramming.pub/the-minimum-guide-for-using-google-drive-api-with-flutter-9207e4cb05ba
class GooglePhotoClient {
  late final http.Client _client;
  late final Future<Map<String, String>> _header;

  GooglePhotoClient(this._header, this._client);
}
