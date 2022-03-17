import 'package:flutter/material.dart';

import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/main.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/screens/manage_my_albums_screen.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';


class MyAlbumsScreen extends StatefulWidget {
  const MyAlbumsScreen({Key? key}) : super(key: key);

  @override
  State<MyAlbumsScreen> createState() => _MyAlbumsScreenState();
}

navigateToManageMyAlbums(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return MyHomePage();
  }));
}

class _MyAlbumsScreenState extends State<MyAlbumsScreen> {
  List<Album> albums = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToManageMyAlbums(context),
      ),
      appBar: AppBar(
        title: Text(
          'My Albums'
        ),
      ),
      body: AlbumListWidget(
          albumList
      ));
  }
}
