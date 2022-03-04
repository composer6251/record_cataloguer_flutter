import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';
import '../model/album.dart';

/***
 * This class holds the album list state and injects the album data into the AlbumListWidget
 *
 * Widget chart: main.dart => AlbumListView => AlbumListWidget
 *
 */
class AlbumListView extends StatefulWidget {
  const AlbumListView({Key? key}) : super(key: key);

  @override
  _AlbumListViewState createState() => _AlbumListViewState();
}

class _AlbumListViewState extends State<AlbumListView> {

  List<AlbumModel> albums = [
    AlbumModel(
      // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumArtist: 'ArtistName',
        albumName: 'first album',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'second album',
    //     albumPrice: 15.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   // albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'third album',
    //     albumPrice: 25.00,
    //     albumQuantity: 1,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'fourth album',
    //     albumPrice: 35.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   // albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'fifth album',
    //     albumPrice: 20.00,
    //     albumQuantity: 1,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'sixth album',
    //     albumPrice: 25.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'seventh album',
    //     albumPrice: 15.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   // albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'eighth album',
    //     albumPrice: 25.00,
    //     albumQuantity: 1,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'ninth album',
    //     albumPrice: 35.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   // albumImage: Image.asset('images/diamond.png'),
    //     albumImage: 'diamond.png',
    //     albumArtist: 'ArtistName',
    //     albumName: 'tenth album',
    //     albumPrice: 20.00,
    //     albumQuantity: 1,
    //     upc: BigInt.from(123456)),
    // AlbumModel(
    //   //  albumImage: Image.asset('images/diamond.png'),
    //     albumImage: '',
    //     albumArtist: 'ArtistName',
    //     albumName: '11th album',
    //     albumPrice: 25.00,
    //     albumQuantity: 5,
    //     upc: BigInt.from(123456)),
  ];

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

  void _addNewAlbum(String artist, String album){
    if(artist == '' || album == ''){
      // todo: Save input text if erroring out
      showAlertDialog(context);
      return;
    }
    final newAlbum = AlbumModel(albumImage: '', albumArtist: artist, albumName: album, albumPrice: 0, albumQuantity: 1, upc: BigInt.from(0));
    setState(() {
      albums.add(newAlbum);
    });
  }

  bool showAddAlbumWidget = false;

  setPageState(){
    setState(() {
      showAddAlbumWidget = !showAddAlbumWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
            children: [
              FloatingActionButton(
                onPressed: () => { setPageState() },
                child: showAddAlbumWidget ? Text('Hide') : Text('Add'),
              ),
              showAddAlbumWidget ? AddAlbumWidget(_addNewAlbum) : Container(),
              AlbumListWidget(albums),
            ],
          ),
      ),
    );
  }
}
