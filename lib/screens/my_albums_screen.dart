import 'package:flutter/material.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/screens/manage_my_albums_screen.dart';
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
        albumImage: '',
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
                  delegate: CustomSearchDelegate(),
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

class CustomSearchDelegate extends SearchDelegate {

  // Handles return to page
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
          Icons.arrow_back,
      ),
      onPressed: () => close(context, null), // close search bar
    );
    // TODO: implement buildLeading
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          else {
            query = '';
          }
        },
      )
    ];
  }

  // Build Result of search
  @override
  Widget buildResults(BuildContext context) {
    // create var to hold album, artist, and ????
    // loop through albums, to get album and artist to create Map<String, Album>. Allowing for duplicate Albums for both artist and name
    List<Album> searchAlbums = [];
    List<Album> testAlbums = albumList.where((album) => album.albumName.toLowerCase().contains(query.toLowerCase())).toList();
    for (var album in albumList) {
      if (album.albumArtist.toLowerCase().contains(query.toLowerCase()) || album.albumName.toLowerCase().contains(query.toLowerCase())){
        print('adding album to search: ' + album.toString());
        searchAlbums.add(album);
      }
    }

    // see if query.contains album or artist

    return ListView.builder(
      itemBuilder: (context, index) {
        return AlbumListWidget(testAlbums);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      return Text('No suggestions');
  }
}
