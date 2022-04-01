import 'package:record_cataloguer/model/album.dart';

  List<Album> albumList = [
     Album(
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Led Zeppelin',
        albumName: 'Led Zeppelin Four',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    Album(
        albumImageUrl: 'assets/images/cat-stevens.jpeg',
        albumArtist: 'Cat Stevens',
        albumName: 'Tea for the Tilerman',
        albumPrice: 15.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    Album(
        albumImageUrl: '',
        albumArtist: 'Pink Floyd',
        albumName: 'The Wall',
        albumPrice: 25.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    Album(
        albumImageUrl: '',
        albumArtist: 'Synthery',
        albumName: 'Synthery',
        albumPrice: 35.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    Album(
        albumImageUrl: '',
        albumArtist: 'Beethoven',
        albumName: 'Coriolan Overture',
        albumPrice: 20.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    Album(
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Beatles',
        albumName: 'White Album',
        albumPrice: 25.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
  ];
