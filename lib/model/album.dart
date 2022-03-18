
class Album {
  // todo: Keep as image or make String for albumImage
  late String albumImage;
  late String albumArtist;
  late String albumName;
  late double albumPrice;
  late int albumQuantity;
  late BigInt upc;
  late DateTime scannedDate;

  Album({
    required this.albumImage,
    required this.albumArtist,
    required this.albumName,
    required this.albumPrice,
    required this.albumQuantity,
    required this.upc,
    required this.scannedDate,
  });

  // factory method to parse response object to Album object from JSON
  // todo: Use correct JSON fields
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumImage: '',
        albumArtist: json['artist'],
        albumName: json['name'],
        albumPrice: json['price'],
        albumQuantity: 0,
        upc: BigInt.zero,
        scannedDate: DateTime.now(),
    );
  }
}
