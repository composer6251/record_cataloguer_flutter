import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
import 'package:record_cataloguer/style/base_font_sizes.dart';
import 'package:record_cataloguer/style/base_gutter_sizes.dart';

import 'album_bottom_button_bar.dart';
import 'album_widget.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatefulWidget {
  @override
  State<AlbumListWidget> createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  // todo: Move to constants file
  static const String NO_ALBUMS_MESSAGE = 'You do not have any albums in your portfolio.';
  static const String GET_STARTED_MESSAGE = '\nTo get started adding, either: ';
  static const String GET_STARTED_INSTRUCTIONS = '\nTap the pink button with the camera icon to get started scanning \nor\n'
      '\nTap the green button to manually enter album information.';
  @override
  Widget build(BuildContext context) {
    print('rebuilding album list widget');
    return Stack(fit: StackFit.expand, children: [ // StackFit.expand tells widget to take up available space
      Consumer<AlbumListModel>(builder: (context, albums, child) {
        return albums.albumsList.isEmpty
            ? Center(
              child: Column(
                children: [
                  Text( // todo: create widget that takes the text/style params???
                    NO_ALBUMS_MESSAGE,
                    style: TextStyle(
                      fontSize: LARGE_FONT,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    GET_STARTED_MESSAGE,
                    style: TextStyle(
                      fontSize: LARGE_FONT,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    GET_STARTED_INSTRUCTIONS,
                    style: TextStyle(
                      fontSize: LARGE_FONT,
                    ),
                  ),
                ],
              ),
            )
            : ListView.builder( // todo: The BottomButtonBar obscures the last card on screen
                itemBuilder: (context, index) {
                  return ClipPath(
                    clipBehavior: Clip.hardEdge,
                     child: AlbumWidget(albums.albumsList[index]) // todo: Figure out how to use this as stateful
                    // child: AlbumCardWidget(index),
                  );
                },
                itemCount: albums.albumsList.length,
              );
      }),
      Positioned(
          bottom: MEDIUM_GUTTER,
          left: 0, // left and right at 0 so width is full screen
          right: 0,
          child: BottomButtonBar()),
    ]);
  }
}
