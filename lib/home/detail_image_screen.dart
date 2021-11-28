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
        appBar: AppBar(title: const Text('Detail'), centerTitle: true),
        body: Center(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              widget.media.baseUrl ?? Constants.imageDefault,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
