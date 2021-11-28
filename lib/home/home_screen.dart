import 'package:flutter/material.dart';
import 'package:photo_image/api/model/album.dart';
import 'package:photo_image/common/constants.dart';
import 'package:photo_image/home/list_image_screen.dart';
import 'package:photo_image/manager/photo_manager.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos')),
      body: FutureBuilder<List<Album>>(
        future: PhotoManager.getInstance().getAlbums(),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snap) {
          if (snap.hasData) {
            final albums = snap.data ?? List.empty();
            return ListView.builder(
                itemCount: albums.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Row(
                      children: [
                        Image.network(
                          albums[index].coverPhotoBaseUrl ??
                              Constants.imageDefault,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: Text(
                            albums[index].title ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      final album = albums[index];
                      Navigator.of(context).pushNamed(ListImageScreen.routeName,
                          arguments: album);
                    },
                  );
                });
          } else if (snap.hasError) {
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
