import 'package:flutter/material.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';
import 'package:http/http.dart' as http;

import '../model/album.dart';

/***
 * This class holds the album list state and injects the album data into the AlbumListWidget
 *
 * Widget chart: main.dart => AlbumListView => AlbumListWidget
 *
 */
class ManageMyAlbumsScreen extends StatefulWidget {
  const ManageMyAlbumsScreen({Key? key}) : super(key: key);

  @override
  _ManageMyAlbumsScreenState createState() => _ManageMyAlbumsScreenState();
}

class _ManageMyAlbumsScreenState extends State<ManageMyAlbumsScreen> {
    List<Album> albums = albumList;

  // set up alert dialog box
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
      albums.insert(0, newAlbum);
    });
  }

  bool showAddAlbumWidget = false;
  setPageState(){
    setState(() {
      showAddAlbumWidget = !showAddAlbumWidget;
    });
  }

  openAddAlbumModal(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return AddAlbumWidget(_addNewAlbum);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
            children: [
              FloatingActionButton(
                onPressed: () => { 
                //  setPageState()
                  openAddAlbumModal(context)
                },
                child: showAddAlbumWidget ? Text('Hide') : Text('Add'),
              ),
              Title(
                color: Colors.black,
                child: const Text(
                  'My Albums',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              showAddAlbumWidget ? AddAlbumWidget(_addNewAlbum) : Container(),
              AlbumListWidget(albums),
            ],
          ),
      ),
    );
  }
}
