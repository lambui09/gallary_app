import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photo_image/home/home_screen.dart';
import 'package:photo_image/manager/photo_manager.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final StreamController<bool> streamLogin = StreamController();

  @override
  void dispose() {
    streamLogin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asserts/image/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<bool>(
                    stream: streamLogin.stream,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == true) {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.routeName,
                              (a) => false,
                            );
                          });
                          return const Text('Login Success');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      } else if (snapshot.hasError) {
                        return const Text(
                          'Login fail, please check network and information again',
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.red)))),
                  child: const Text('Login with google'),
                  onPressed: () async {
                    streamLogin.sink.add(false);
                    final result = await PhotoManager.getInstance().signIn();
                    if (result) {
                      streamLogin.sink.add(true);
                    } else {
                      streamLogin.sink.addError(Exception('Login Failure'));
                    }
                  },
                )
                //add
              ],
            ),
          ),
        ),
      ),
    );
  }
}
