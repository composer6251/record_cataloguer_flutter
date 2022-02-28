
class AlbumModel {
  // todo: Keep as image or make String for albumImage
  late String albumImage;
  late String albumArtist;
  late String albumName;
  late double albumPrice;
  late int albumQuantity;
  late BigInt upc;
  late DateTime? scannedDate;

  AlbumModel({
    required this.albumImage,
    required this.albumArtist,
    required this.albumName,
    required this.albumPrice,
    required this.albumQuantity,
    required this.upc,
    this.scannedDate,
  });
}
