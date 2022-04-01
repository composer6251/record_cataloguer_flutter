import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatelessWidget {
  final List<Album> albums;
  const AlbumListWidget(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: ListView.builder(// Listview(children[]) does NOT create children lazily. Listview.builder() does create Lazily.
        itemBuilder: (context, index) {
          return ClipPath(
            clipBehavior: Clip.hardEdge,
              child: Card(
                elevation: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 100.00,
                        height: 100.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: albums[index].albumImageUrl == '' ?
                            const ExactAssetImage(
                              'assets/images/no-image-available.svg.png',
                              scale: 1,
                            ) :
                            ExactAssetImage(
                              albums[index].albumImageUrl,
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
                          Text(albums[index].albumName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(albums[index].albumArtist),
                          Text(DateFormat.yMMMd().format(albums[index].scannedDate)),
                          Container(
                            padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColorLight, width: 2),
                                borderRadius: const BorderRadius.all(Radius.elliptical(1, 10)),
                              ),
                              child: Text(
                                '\$${albums[index].albumPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              )
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.only(right: 40),
                          width: 100,
                          alignment: Alignment.centerRight,
                          child: Text(
                            'x${albums[index].albumQuantity}', style: const TextStyle(fontSize: 20),
                          )
                      ),
                    )
                  ],
                ),
              ),
          );
        },
        itemCount: albums.length,
      ),
    );
  }
}
