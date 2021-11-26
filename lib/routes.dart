import 'package:flutter/widgets.dart';
import 'package:photo_image/authen/login_screen.dart';
import 'package:photo_image/home/home_screen.dart';
import 'package:photo_image/home/list_image_screen.dart';

//routes define
final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ListImageScreen.routeName: (context) => const ListImageScreen()
};

