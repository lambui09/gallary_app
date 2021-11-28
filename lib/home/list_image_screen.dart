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
      appBar: AppBar(title: const Text('List Image')),
      body: FutureBuilder<List<Media>>(
        future: PhotoManager.getInstance().getPhotosFromAlbum(widget.album),
        builder: (BuildContext context, AsyncSnapshot<List<Media>> snap) {
          if (snap.hasData) {
            final mediaList = snap.data ?? List.empty();
            return ListView.builder(
                itemCount: mediaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Row(
                      children: [
                        Image.network(
                          mediaList[index].baseUrl ?? Constants.imageDefault,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: Text(
                            mediaList[index].filename ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      final media = mediaList[index];
                      Navigator.of(context).pushNamed(
                          DetailImageScreen.routeName,
                          arguments: media);
                    },
                  );
                });
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
