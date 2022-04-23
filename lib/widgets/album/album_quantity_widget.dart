import 'package:flutter/material.dart';
import 'package:record_cataloguer/styles/base_font_sizes.dart';

class AlbumQuantityWidget extends StatelessWidget {
  const AlbumQuantityWidget({
    Key? key,
    required this.albumQuantity,
  }) : super(key: key);

  final int albumQuantity;

  @override
  Widget build(BuildContext context) {
    return Text(
      'x$albumQuantity',
      style: const TextStyle(
        fontSize: MEDIUM_FONT,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}