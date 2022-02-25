import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/model/album.dart';

class AlbumWidget extends StatefulWidget {

  AlbumModel album;
  AlbumWidget(this.album, {Key? key}) : super(key: key);

  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  get album => album;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
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
      ),
    );;
  }
}
