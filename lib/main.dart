import 'package:flutter/material.dart';
import 'package:photo_image/api/model/media.dart';
import 'package:photo_image/authen/login_screen.dart';
import 'package:photo_image/home/detail_image_screen.dart';
import 'package:photo_image/home/list_image_screen.dart';
import 'package:photo_image/routes.dart';

import 'api/model/album.dart';
//doc: https://developers.google.com/identity/protocols/oauth2/scopes

void main() {
  runApp(MyApp(
    key: GlobalKey(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery app',
      theme: ThemeData.dark(),
      home: const LoginScreen(),
      initialRoute: '/',
      routes: routes,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ListImageScreen.routeName:
            {
              final album = settings.arguments as Album; // Retrieve the value.
              print('ablum');
              print(album);
              return MaterialPageRoute(
                  builder: (_) => ListImageScreen(album: album));
            }
          case DetailImageScreen.routeName:
            final media = settings.arguments as Media; // Retrieve the value.
            print('media');
            print(media);
            return MaterialPageRoute(
                builder: (_) => DetailImageScreen(media: media));
        }
        return null; // Let `onUnknownRoute
      },
    );
  }
}
