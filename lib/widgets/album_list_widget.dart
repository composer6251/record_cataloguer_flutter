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
    return Container(
      height: 325,
      child: ListView.builder(// Listview(children[]) does NOT create children lazily. Listview.builder() does create Lazily.
        itemBuilder: (context, index) {
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
                    Text(albums[index].albumName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(DateFormat.yMMMd().format(DateTime.now())),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 2),
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
                Container(
                    padding: EdgeInsets.only(right: 20),
                    width: 100,
                    alignment: Alignment.centerRight,
                    child: Text('x${albums[index].albumQuantity}', style: const TextStyle(fontSize: 20),
                    )
                )
              ],
            ),
          );
        },
        itemCount: albums.length,
      ),
    );
  }
}
