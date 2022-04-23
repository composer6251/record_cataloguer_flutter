import 'package:flutter/cupertino.dart';

class AlbumModel extends ChangeNotifier {
  // todo: Keep as image or make String for albumImage
  late int albumId;
  late String albumImageUrl;
  late String albumArtist;
  late String albumName;
  late double albumPrice;
  late int albumQuantity;
  late BigInt upc;
  late DateTime scannedDate;

  AlbumModel({
    required this.albumId,
    this.albumImageUrl = 'assets/images/no-image-available.svg.png',
    required this.albumArtist,
    required this.albumName,
    required this.albumPrice,
    required this.albumQuantity,
    required this.upc,
    required this.scannedDate,
  }) : assert(albumImageUrl != null); // todo: What does this do??

  // factory method to parse response object to Album object from JSON
  // todo: Use correct JSON fields
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      albumId: 0,
      albumImageUrl: '',
      albumArtist: json['artist'],
      albumName: json['name'],
      albumPrice: json['price'],
      albumQuantity: 0,
      upc: BigInt.zero,
      scannedDate: DateTime.now(),
    );
  }
}
