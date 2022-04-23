import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';

// todo: should this be combined with the create_collection button?
class AlbumDeleteBulkButton extends StatelessWidget {
  const AlbumDeleteBulkButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(
        Icons.delete,
        size: 25,
      ),
      onPressed: () => {
        // if deleteMode is on and this is pressed, delete the albums, and switch deleteMode, and switch Icon on the button
        Provider.of<AlbumListModel>(context, listen: false).deleteBulk()
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 10,
      ),
    );
  }
}