import 'package:flutter/material.dart';
import 'package:photo_image/api/model/media.dart';
import 'package:photo_image/authen/login_screen.dart';
import 'package:photo_image/home/detail_image_screen.dart';
import 'package:photo_image/home/list_image_screen.dart';
import 'package:photo_image/routes.dart';

import 'api/model/album.dart';

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
              final album = settings.arguments as Album;
              return MaterialPageRoute(
                  builder: (_) => ListImageScreen(album: album));
            }
          case DetailImageScreen.routeName:
            final media = settings.arguments as Media;
            return MaterialPageRoute(
                builder: (_) => DetailImageScreen(media: media));
        }
        return null; // Let `onUnknownRoute
      },
    );
  }
}
