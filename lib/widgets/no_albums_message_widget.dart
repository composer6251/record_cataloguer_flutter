import 'package:flutter/material.dart';
import 'package:record_cataloguer/styles/base_font_sizes.dart';

class NoAlbumsMessage extends StatelessWidget {
  const NoAlbumsMessage({
    Key? key,
    required this.NO_ALBUMS_MESSAGE,
    required this.GET_STARTED_MESSAGE,
    required this.GET_STARTED_INSTRUCTIONS,
  }) : super(key: key);

  final String NO_ALBUMS_MESSAGE;
  final String GET_STARTED_MESSAGE;
  final String GET_STARTED_INSTRUCTIONS;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text( // todo: create widget that takes the text/style params???
            NO_ALBUMS_MESSAGE,
            style: const TextStyle(
              fontSize: LARGE_FONT,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            GET_STARTED_MESSAGE,
            style: const TextStyle(
                fontSize: LARGE_FONT,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            GET_STARTED_INSTRUCTIONS,
            style: const TextStyle(
              fontSize: LARGE_FONT,
            ),
          ),
        ],
      ),
    );
  }
}