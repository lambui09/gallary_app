import 'package:flutter/material.dart';
import 'package:photo_image/authen/login_screen.dart';
import 'package:photo_image/manager/photo_manager.dart';
import 'package:photo_image/routes.dart';
import 'package:flutter_provider/flutter_provider.dart';
//doc: https://developers.google.com/identity/protocols/oauth2/scopes

void main() {
  runApp(
    Provider.factory((ctx) => PhotoManager(), child: const MyApp()),
  );
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
    );
  }
}
