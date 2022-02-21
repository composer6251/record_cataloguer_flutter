import 'package:flutter/material.dart';


class Album extends StatelessWidget {
  const Album({Key? key}) : super(key: key);

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
