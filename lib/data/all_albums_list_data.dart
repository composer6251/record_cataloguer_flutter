import 'package:record_cataloguer/models/album.dart';

  List<AlbumModel> allAlbumsList = [
     AlbumModel(
        albumId: ++primaryKeyCounter, // TODO: This only mocks a PK situation. Any New albums currently generate a new Id by referring to the albumlist.length + 1
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Led Zeppelin',
        albumName: 'Led Zeppelin Four',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumId: ++primaryKeyCounter,
        albumImageUrl: 'assets/images/cat-stevens.jpeg',
        albumArtist: 'Cat Stevens',
        albumName: 'Tea for the Tilerman',
        albumPrice: 15.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumId: ++primaryKeyCounter,
        albumImageUrl: 'assets/images/Pink Floyd The Wall.jpeg',
        albumArtist: 'Pink Floyd',
        albumName: 'The Wall',
        albumPrice: 25.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumId: ++primaryKeyCounter,
        albumImageUrl: NO_IMAGE_AVAILABLE,
        albumArtist: 'Synthery',
        albumName: 'Synthery',
        albumPrice: 35.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumId: ++primaryKeyCounter,
        albumImageUrl: 'assets/images/Beethoven.jpeg',
        albumArtist: 'Beethoven',
        albumName: 'Coriolan Overture',
        albumPrice: 20.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        albumId: ++primaryKeyCounter,
        albumImageUrl: 'assets/images/diamond.png',
        albumArtist: 'Beatles',
        albumName: 'White Album',
        albumPrice: 25.00,
        albumQuantity: 5,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
  ];

  int primaryKeyCounter = 0;

  const String NO_IMAGE_AVAILABLE = 'assets/images/no-image-available.svg.png';