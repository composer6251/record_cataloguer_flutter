import 'package:flutter/material.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/screens/manage_my_albums_screen.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';


class MyAlbumsScreen extends StatefulWidget {
  const MyAlbumsScreen({Key? key}) : super(key: key);

  @override
  State<MyAlbumsScreen> createState() => _MyAlbumsScreenState();
}

void navigateToManageMyAlbums(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return ManageMyAlbumsScreen();
  }));
}

class _MyAlbumsScreenState extends State<MyAlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget> [
            FloatingActionButton(
              backgroundColor: Colors.green,
              elevation: 25,
              child: const FittedBox(
                child: Text(
                    'Manage'
                ),
              ),
              onPressed: () => navigateToManageMyAlbums(context),
            ),
          ],
        centerTitle: true,
        title: const Text(
          'My Albums'
        ),
      ),
      body: AlbumListWidget(
          albumList
      ));
  }
}
