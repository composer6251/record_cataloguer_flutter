import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/style/base_font_sizes.dart';
import 'package:record_cataloguer/style/base_gutter_sizes.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';

import 'album_bottom_button_bar.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatefulWidget {
  final List<AlbumModel> albums;
  const AlbumListWidget(this.albums, {Key? key}) : super(key: key);

  @override
  State<AlbumListWidget> createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          // Listview(children[]) does NOT create children lazily. Listview.builder() does create Lazily.
          itemBuilder: (context, index) {
            return ClipPath(
              clipBehavior: Clip.hardEdge,
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(SMALL_GUTTER),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: 100.00,
                          height: 100.00,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.albums[index].albumImageUrl == ''
                                  ? const ExactAssetImage(
                                      'assets/images/no-image-available.svg.png',
                                      scale: 1,
                                    )
                                  : ExactAssetImage(
                                      widget.albums[index].albumImageUrl,
                                      scale: 1,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.albums[index].albumArtist.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: LARGE_GUTTER,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.albums[index].albumName.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: MEDIUM_GUTTER,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                            width: 100,
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                                  child: Text(
                                    'x${widget.albums[index].albumQuantity}',
                                    style: TextStyle(
                                      fontSize: MEDIUM_FONT,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //   color: Theme.of(context).primaryColorLight, width: 2),
                                  //   borderRadius: const BorderRadius.all(Radius.elliptical(1, 10)),
                                  // ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        EXTRA_SMALL_GUTTER),
                                    child: Text(
                                      '\$${widget.albums[index].albumPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                                  child: Text(
                                    DateFormat.yMMMd().format(
                                        widget.albums[index].scannedDate),
                                    style: TextStyle(
                                      fontSize: MEDIUM_FONT,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: widget.albums.length,
        ),
        Positioned(
          bottom: SMALL_GUTTER,
          left: 0, // left and right at 0 so width is full screen
          right: 0,
          child: BottomButtonBar(),
        )
      ],
    );
  }
}
