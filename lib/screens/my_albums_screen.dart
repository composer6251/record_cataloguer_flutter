import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
import 'package:record_cataloguer/screens/manage_my_albums_screen.dart';
import 'package:record_cataloguer/searchalbums/search_albums.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';

class MyAlbumsScreen extends StatefulWidget {
  const MyAlbumsScreen({Key? key}) : super(key: key);

  @override
  State<MyAlbumsScreen> createState() => _MyAlbumsScreenState();
}

class _MyAlbumsScreenState extends State<MyAlbumsScreen> {

  void navigateToManageMyAlbums(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Container();//ManageMyAlbumsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchAlbums(),
              );
            },
            icon: const Icon(Icons.search),
          ),
          ElevatedButton(
            style: const ButtonStyle(),
            child: const FittedBox(
              child: Text('Filter'),
            ),
            onPressed: () => navigateToManageMyAlbums(context),
          ),
        ],
        centerTitle: true,
        title: const Text('My Albums'),
      ),
      body: AlbumListWidget(),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Navigation Menu'),
              ),
              ListTile(
                title: Text('List Tile 1'),
              ),
              ListTile(
                title: Text('List Tile 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
