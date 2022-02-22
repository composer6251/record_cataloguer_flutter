import 'package:flutter/material.dart';


class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: const [
            Text('Album Title'),
            Text('Image Placeholder'),
            Text('Album Price'),
            Text('Album Quantity'),
          ],
        ),
    );
  }
}
