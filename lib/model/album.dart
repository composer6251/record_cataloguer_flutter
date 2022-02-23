
import 'package:flutter/material.dart';

class AlbumModel {
  // todo: Keep as image or make String for albumImage
  late String albumImage;
  late String albumName;
  late double albumPrice;
  late int albumQuantity;
  late BigInt upc;

  AlbumModel({
    required this.albumImage,
    required this.albumName,
    required this.albumPrice,
    required this.albumQuantity,
    required this.upc,
  });
}