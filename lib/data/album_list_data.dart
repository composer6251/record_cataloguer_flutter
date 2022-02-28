
import 'package:record_cataloguer/model/album.dart';

// class AlbumListData {
//
//   List<AlbumModel> getAlbums() {
//     return albums;
//   }

// todo: Implement Mock Data Class instead of having data in album_list_view

  List<AlbumModel> albumList = [
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
// }
