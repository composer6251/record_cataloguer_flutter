import 'package:record_cataloguer/model/album.dart';

  List<AlbumModel> albumList = [
     AlbumModel(
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Led Zeppelin',
        albumName: 'Led Zeppelin Four',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumImageUrl: 'assets/images/cat-stevens.jpeg',
        albumArtist: 'Cat Stevens',
        albumName: 'Tea for the Tilerman',
        albumPrice: 15.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumImageUrl: 'assets/images/Pink Floyd The Wall.jpeg',
        albumArtist: 'Pink Floyd',
        albumName: 'The Wall',
        albumPrice: 25.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumImageUrl: '',
        albumArtist: 'Synthery',
        albumName: 'Synthery',
        albumPrice: 35.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumImageUrl: 'assets/images/Beethoven.jpeg',
        albumArtist: 'Beethoven',
        albumName: 'Coriolan Overture',
        albumPrice: 20.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Beatles',
        albumName: 'White Album',
        albumPrice: 25.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
  ];

  const String NO_IMAGE_AVAILABLE = 'assets/images/no-image-available.svg.png';