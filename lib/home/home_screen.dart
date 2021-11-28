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
      appBar: AppBar(title: const Text('Photos'), centerTitle: true),
      body: FutureBuilder<List<Album>>(
        future: PhotoManager.getInstance().getAlbums(),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snap) {
          if (snap.hasData) {
            final albums = snap.data ?? List.empty();
            return GridView.count(
              // crossAxisCount is the number of columns
              crossAxisCount: 2,
              // This creates two columns with two items in each column
              children: List.generate(albums.length, (index) {
                return GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      Image.network(
                        albums[index].coverPhotoBaseUrl ??
                            Constants.imageDefault,
                        fit: BoxFit.fill,
                        width: 200,
                        height: 320,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(albums[index].title ?? "",
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
                    final album = albums[index];
                    Navigator.of(context)
                        .pushNamed(ListImageScreen.routeName, arguments: album);
                  },
                );
              }),
            );
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
