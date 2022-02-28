import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * This class widget receives the albumList via constructor injection
 */

class AlbumListWidget extends StatelessWidget {
  final List<AlbumModel> albums;
  const AlbumListWidget(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        albums.map((album) {
          return Card(
            elevation: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'images/cat-stevens.jpeg',
                        scale: 1,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(album.albumName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(DateFormat.yMMMd().format(DateTime.now())),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 2),
                          borderRadius: const BorderRadius.all(Radius.elliptical(1, 10)),
                        ),
                        child: Text(
                          '\$${album.albumPrice}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                    ),
                  ],
                ),
                Container(
                    width: 100,
                    alignment: Alignment.centerRight,
                    child: Text('x${album.albumQuantity}', style: const TextStyle(fontSize: 20),
                    )
                )
              ],
            ),
          );
        }).toList(),
    );
  }
}
