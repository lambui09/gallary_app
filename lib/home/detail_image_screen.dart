import 'package:flutter/material.dart';
import 'package:photo_image/api/model/media.dart';

import '../common/constants.dart';

class DetailImageScreen extends StatefulWidget {
  static const routeName = '/detail_screen';
  final Media media;

  const DetailImageScreen({Key? key, required this.media}) : super(key: key);

  @override
  _DetailImageScreen createState() => _DetailImageScreen();
}

class _DetailImageScreen extends State<DetailImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      widget.media.baseUrl ?? Constants.imageDefault),
                  fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.0),
                ])),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.media.filename ?? "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
          ),
        ),
      ),
    );
  }
}
