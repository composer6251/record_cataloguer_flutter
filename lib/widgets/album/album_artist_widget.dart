import 'package:flutter/material.dart';
import 'package:record_cataloguer/styles/base_gutter_sizes.dart';

class AlbumArtistWidget extends StatelessWidget {
  const AlbumArtistWidget({
    Key? key,
    required this.albumArtist,
    required this.albumName,
  }) : super(key: key);

  final String albumArtist;
  final String albumName;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            albumArtist,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: LARGE_GUTTER,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            albumName.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: MEDIUM_GUTTER,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}