import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_image/authen/login_screen.dart';
import 'package:photo_image/home/home_screen.dart';
import 'package:photo_image/routes.dart';
//doc: https://developers.google.com/identity/protocols/oauth2/scopes
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/photoslibrary',
  'https://www.googleapis.com/auth/photoslibrary.readonly.appcreatedata',
  'https://www.googleapis.com/auth/photoslibrary.sharing'
]);

void main() {
  runApp(const MyApp());
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
