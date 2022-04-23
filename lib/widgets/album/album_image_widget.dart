import 'package:flutter/material.dart';

class AlbumImageWidget extends StatelessWidget {
  const AlbumImageWidget({
    Key? key,
    required this.albumImageUrl,
  }) : super(key: key);

  final String albumImageUrl;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        width: 100.00,
        height: 100.00,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: albumImageUrl == ''
                ? const ExactAssetImage(
              'assets/images/no-image-available.svg.png', // todo: This is breaking upon generating the card because it can't find the image
              scale: 1,
            )
                : ExactAssetImage(
              albumImageUrl,
              scale: 1,
            ),
          ),
        ),
      ),
    );
  }
}