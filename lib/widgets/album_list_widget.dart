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
  @override
  Widget build(BuildContext context) {
    print('rebuilding album list widget');
    return Stack(children: [
      Consumer<AlbumListModel>(builder: (context, albums, child) {
        return ListView.builder(
          // Listview(children[]) does NOT create children lazily. Listview.builder() does create Lazily.
          itemBuilder: (context, index) {
            return ClipPath(
              clipBehavior: Clip.hardEdge,
              child:
              AlbumCardWidget(index),
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

  // Card AlbumCardWidget(int index) {
  //   return Card(
  //             elevation: 20,
  //             child: Padding(
  //               padding: const EdgeInsets.all(SMALL_GUTTER),
  //               child: Consumer<AlbumListModel>(
  //                   builder: (context, albums, child) {
  //                 return Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Flexible(
  //                       flex: 1,
  //                       child: Container(
  //                         width: 100.00,
  //                         height: 100.00,
  //                         decoration: BoxDecoration(
  //                           image: DecorationImage(
  //                             image: albums.albumsList[index].toString() == ''
  //                                 ? const ExactAssetImage(
  //                               'assets/images/no-image-available.svg.png',
  //                                     scale: 1,
  //                                   )
  //                                 : ExactAssetImage(
  //                                     albums.albumsList[index].albumImageUrl,
  //                                     scale: 1,
  //                                   ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Flexible(
  //                       flex: 1,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             albums.albumsList[index].albumArtist,
  //                             textAlign: TextAlign.center,
  //                             style: const TextStyle(
  //                               fontSize: LARGE_GUTTER,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                           Text(
  //                             albums.albumsList[index].albumName
  //                                 .toUpperCase(),
  //                             overflow: TextOverflow.ellipsis,
  //                             style: const TextStyle(
  //                               fontSize: MEDIUM_GUTTER,
  //                               fontStyle: FontStyle.italic,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Flexible(
  //                       flex: 1,
  //                       child: Container(
  //                           width: 100,
  //                           alignment: Alignment.centerRight,
  //                           child: Column(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.all(
  //                                     EXTRA_SMALL_GUTTER),
  //                                 child: Text(
  //                                   'x${albums.albumsList[index].albumQuantity}',
  //                                   style: TextStyle(
  //                                     fontSize: MEDIUM_FONT,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               Container(
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.all(
  //                                       EXTRA_SMALL_GUTTER),
  //                                   child: Text(
  //                                     '\$${albums.albumsList[index].albumPrice.toStringAsFixed(2)}',
  //                                     style: const TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: const EdgeInsets.all(
  //                                     EXTRA_SMALL_GUTTER),
  //                                 child: Text(
  //                                   DateFormat.yMMMd().format(
  //                                       albums.albumsList[index].scannedDate),
  //                                   style: TextStyle(
  //                                     fontSize: MEDIUM_FONT,
  //                                     fontStyle: FontStyle.italic,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           )),
  //                     )
  //                   ],
  //                 );
  //               }),
  //             ),
  //           );
  // }
}
