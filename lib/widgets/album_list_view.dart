import 'package:flutter/material.dart';
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
        albumName: 'first album',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
      //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'second album',
        albumPrice: 15.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
    AlbumModel(
      // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'third album',
        albumPrice: 25.00,
        albumQuantity: 1,
        upc: BigInt.from(123456)),
    AlbumModel(
      //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'fourth album',
        albumPrice: 35.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
    AlbumModel(
      // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'fifth album',
        albumPrice: 20.00,
        albumQuantity: 1,
        upc: BigInt.from(123456)),
    AlbumModel(
      //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'sixth album',
        albumPrice: 25.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
  ];
  @override
  Widget build(BuildContext context) {
    return AlbumListWidget(albums);
  }
}
