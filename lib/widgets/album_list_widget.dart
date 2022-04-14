import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
import 'package:record_cataloguer/style/base_gutter_sizes.dart';

import 'album_bottom_button_bar.dart';
import 'album_card_widget.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatefulWidget {
  @override
  State<AlbumListWidget> createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  // todo: Move to constants file
  static const String ALBUM_LIST_INSTRUCTIONS =
      'You do not have any albums in your portfolio. To get started adding, either: '
      '\nTap the pink button with the camera icon to get started scanning or'
      '\nTap the green button to manually enter album information.';
  @override
  Widget build(BuildContext context) {
    print('rebuilding album list widget');
    return Stack(children: [
      Consumer<AlbumListModel>(builder: (context, albums, child) {
        return albums.albumsList.isEmpty
            ? Container(
                child: Text(
                  ALBUM_LIST_INSTRUCTIONS,
                ),
              )
            : ListView.builder(
                // Listview(children[]) does NOT create children lazily. Listview.builder() does create Lazily.
                itemBuilder: (context, index) {
                  return ClipPath(
                    clipBehavior: Clip.hardEdge,
                    child: AlbumCardWidget(index),
                  );
                },
                itemCount: albums.albumsList.length,
              );
      }),
      Positioned(
          bottom: SMALL_GUTTER,
          left: 0, // left and right at 0 so width is full screen
          right: 0,
          child: BottomButtonBar()),
    ]);
  }
}
