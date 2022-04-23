import 'package:flutter/material.dart';

class AlbumScanButton extends StatelessWidget {
  const AlbumScanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        Icons.add_a_photo,
        size: 25,
      ),
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        primary: Colors.pink,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 10,
      ),
    );
  }
}
