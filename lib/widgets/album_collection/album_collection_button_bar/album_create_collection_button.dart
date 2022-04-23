import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';

class AlbumCreateCollectionButton extends StatelessWidget {
  const AlbumCreateCollectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(
        Icons.bookmark,
        size: 25,
      ),
      onPressed: () => {
        // if bulkSelectMode is on and this is pressed, create the list and switch bulkUpdateMode
        Provider.of<AlbumListModel>(context, listen: false).createAlbumList()
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 10,
      ),
    );
  }
}
