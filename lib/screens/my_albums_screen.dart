import 'package:flutter/material.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';
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
      return ManageMyAlbumsScreen();
    }));
  }

  // TODO: IF YOU ARE LEAVING THE ADD ALBUM FUNCTIONALITY, THEN FIGURE OUT WHAT TO DO WITH DUPE CODE IN MANAGE_MY_ALBUMS_SCREEN

  showAlertDialog(BuildContext ctx){

    AlertDialog alert = const AlertDialog(
      title: Text('Error'),
      content: Text('Please complete both Artist and Album fields before submitting'),
    );

    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }

  void _addNewAlbum(String artist, String album, DateTime date){

    if(artist == '' || album == ''){
      // todo: Save input text if erroring out
      showAlertDialog(context);
      return;
    }
    final newAlbum = Album(
        albumImageUrl: '',
        albumArtist: artist,
        albumName: album, albumPrice: 0,
        albumQuantity: 1,
        upc: BigInt.from(0),
        scannedDate: date);

    setState(() {
      albumList.insert(0, newAlbum);
    });
  }

  openAddAlbumModal(BuildContext ctx) {
    showModalBottomSheet(clipBehavior: Clip.hardEdge, context: ctx, builder: (_) {
      return AddAlbumWidget(_addNewAlbum);
    },);
  }
  /***TODO: END DUPE CODE ***/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget> [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchAlbums(),
                );
              },
              icon: const Icon(
                  Icons.search
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
              ),
              child: const FittedBox(
                child: Text(
                    'Filter'
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
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  'Navigation Menu'
                ),
              ),
              ListTile(
                title: Text(
                    'List Tile 1'
                ),
              ),
              ListTile(
                title: Text(
                    'List Tile 2'
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: (
        BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 25,
                  ),
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                    elevation: 10,
                  ),
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.add,
                    size: 25,
                  ),
                  onPressed: () => {
                    openAddAlbumModal(context)
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                    elevation: 10,
                  ),
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.delete,
                    size: 25,
                  ),
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                    elevation: 10,
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
