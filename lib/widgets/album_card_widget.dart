import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
import 'package:record_cataloguer/style/base_font_sizes.dart';
import 'package:record_cataloguer/style/base_gutter_sizes.dart';

Card AlbumCardWidget(int index) {
  return Card(
    elevation: 20,
    child: Padding(
      padding: const EdgeInsets.all(SMALL_GUTTER),
      child: Consumer<AlbumListModel>(builder: (context, albums, child) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: 100.00,
                height: 100.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    // albums.albumsList[index].toString() == ''
                    //     ? const ExactAssetImage(
                    //         'assets/images/no-image-available.svg.png', // todo: This is breaking upon generating the card because it can't find the image
                    //         scale: 1,
                    //       )
                    //     :
                    ExactAssetImage(
                            albums.albumsList[index].albumImageUrl,
                            scale: 1,
                          ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    albums.albumsList[index].albumArtist,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: LARGE_GUTTER,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    albums.albumsList[index].albumName.toUpperCase(),
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
              flex: 2,
              child: Container(
                  width: 100,
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                        child: Text(
                          'x${albums.albumsList[index].albumQuantity}',
                          style: TextStyle(
                            fontSize: MEDIUM_FONT,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                          child: Text(
                            '\$${albums.albumsList[index].albumPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                        child: Text(
                          DateFormat.yMMMd()
                              .format(albums.albumsList[index].scannedDate),
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () => print("index: " + index.toString()),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      }),
    ),
  );
}
