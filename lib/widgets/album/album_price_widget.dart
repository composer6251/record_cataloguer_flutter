import 'package:flutter/material.dart';

class AlbumPriceWidget extends StatelessWidget {
  const AlbumPriceWidget({
    Key? key,
    required this.albumPrice,
  }) : super(key: key);

  final double albumPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${albumPrice.toStringAsFixed(2)}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}