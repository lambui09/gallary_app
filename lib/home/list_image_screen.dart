import 'package:flutter/material.dart';
import 'package:photo_image/api/model/album.dart';
import 'package:photo_image/api/model/media.dart';
import 'package:photo_image/home/detail_image_screen.dart';

import '../common/constants.dart';
import '../manager/photo_manager.dart';

class ListImageScreen extends StatefulWidget {
  static const routeName = '/list_image_screen';
  final Album album;

  const ListImageScreen({Key? key, required this.album}) : super(key: key);

  @override
  _ListImageScreen createState() => _ListImageScreen();
}

class _ListImageScreen extends State<ListImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Image'), centerTitle: true),
      body: FutureBuilder<List<Media>>(
        future: PhotoManager.getInstance().getPhotosFromAlbum(widget.album),
        builder: (BuildContext context, AsyncSnapshot<List<Media>> snap) {
          if (snap.hasData) {
            final mediaList = snap.data ?? List.empty();
            return GridView.count(
              // crossAxisCount is the number of columns
              crossAxisCount: 2,
              // This creates two columns with two items in each column
              children: List.generate(mediaList.length, (index) {
                return GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      Image.network(
                        mediaList[index].baseUrl ?? Constants.imageDefault,
                        fit: BoxFit.fill,
                        width: 180,
                        height: 300,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(mediaList[index].filename ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      )
                    ]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                  ),
                  onTap: () {
                    final media = mediaList[index];
                    Navigator.of(context).pushNamed(DetailImageScreen.routeName,
                        arguments: media);
                  },
                );
              }),
            );
          } else if (snap.hasError) {
            print(snap.error!);
            print(snap.stackTrace);
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
