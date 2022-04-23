import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/constants/message_constants.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';
import 'package:record_cataloguer/styles/base_gutter_sizes.dart';

import '../album/album_widget.dart';
import '../no_albums_message_widget.dart';
import 'album_collection_button_bar/album_collection_button_bar_widget.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatefulWidget {
  @override
  State<AlbumListWidget> createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  // todo: Move to constants file

  @override
  Widget build(BuildContext context) {

    return Stack(fit: StackFit.expand, children: [
      // StackFit.expand tells widget to take up available space
      Consumer<AlbumListModel>(builder: (context, albums, child) {
        return albums.allAlbumsList.isEmpty
            ? const NoAlbumsMessage(
                NO_ALBUMS_MESSAGE: NO_ALBUMS_MESSAGE,
                GET_STARTED_MESSAGE: GET_STARTED_MESSAGE,
                GET_STARTED_INSTRUCTIONS: GET_STARTED_INSTRUCTIONS)
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ClipPath(
                      clipBehavior: Clip.hardEdge,
                      child: AlbumWidget(albums.allAlbumsList[
                          index]) // todo: Figure out how to use this as stateful
                      );
                },
                itemCount: albums.allAlbumsList.length,
              );
      }),
      const Positioned(
          bottom: MEDIUM_GUTTER,
          left: 0, // left and right at 0 so width is full screen
          right: 0,
          child: BottomButtonBar()),
    ]);
  }
}
