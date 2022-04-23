import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/models/album.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';
import 'package:record_cataloguer/styles/base_gutter_sizes.dart';

import 'album_artist_widget.dart';
import 'album_checkbox_widget.dart';
import 'album_delete_icon_widget.dart';
import 'album_image_widget.dart';
import 'album_price_widget.dart';
import 'album_quantity_widget.dart';

/****
 * THIS CLASS IS A STATEFUL VERSION OF THE ALBUM_CARD_WIDGET. IT WAS CREATED TO HANDLE THE LOCAL STATE (CHECKBOX) THAT NEEDED UPDATING
 */
class AlbumWidget extends StatefulWidget {
  // takes current album in list from albumListWidget
  late AlbumModel album;
  AlbumWidget(this.album, {Key? key}) : super(key: key);

  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  List albumsToDelete = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(SMALL_GUTTER),
        child:
            Consumer<AlbumListModel>(builder: (context, albumListModel, child) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlbumImageWidget(albumImageUrl: widget.album.albumImageUrl),
              AlbumArtistWidget( // todo: This should probably be split into 2 widgets
                  albumArtist: widget.album.albumArtist,
                  albumName: widget.album.albumName),
              Flexible(
                flex: 2,
                child: Container(
                    width: 100,
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                          child: AlbumQuantityWidget(
                              albumQuantity: widget.album.albumQuantity),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                            child: AlbumPriceWidget(
                                albumPrice: widget.album.albumPrice),
                          ),
                        ),
                      ],
                    )),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  !albumListModel.bulkSelectMode
                      ? Flexible(
                          flex: 1,
                          child: DeleteAlbumWidget(album: widget.album),
                        )
                      : Flexible(
                          flex: 1,
                          child: AlbumCheckBox(album: widget.album),
                        ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}