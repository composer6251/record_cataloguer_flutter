import 'package:flutter/material.dart';

import '../../add_album_widget.dart';

class AlbumAddButton extends StatelessWidget {
  const AlbumAddButton({
    Key? key,
  }) : super(key: key);

  openAddAlbumModal(BuildContext ctx) {
    showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      context: ctx,
      builder: (_) {
        return AddAlbumWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        Icons.add,
        size: 25,
      ),
      onPressed: () => {openAddAlbumModal(context)},
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 10,
      ),
    );
  }
}