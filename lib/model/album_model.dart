
import 'package:flutter/material.dart';

class AlbumModel {
  late Image albumImage;
  late String albumName;
  late double albumPrice;
  late BigInt upc;

  AlbumModel({
    required this.albumImage,
    required this.albumName,
    required this.albumPrice,
    required this.upc,
  });
}