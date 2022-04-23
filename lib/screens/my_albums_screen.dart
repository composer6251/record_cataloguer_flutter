import 'package:flutter/material.dart';
import 'package:record_cataloguer/widgets/album_collection/album_collection_widget.dart';
import 'package:record_cataloguer/widgets/search_albums_widget.dart';

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
