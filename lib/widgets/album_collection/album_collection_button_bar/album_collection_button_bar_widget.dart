import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';

import 'album_add_button.dart';
import 'album_create_collection_button.dart';
import 'album_delete_bulk_button.dart';
import 'album_edit_button.dart';
import 'album_scan_button.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({Key? key}) : super(key: key);

  // todo: Make the buttons animate. Initial state is one EDIT button. Upon click, the 3 below buttons animate
  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumListModel>(builder: (context, albums, child) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AlbumScanButton(),
          const AlbumAddButton(),
          if (!albums.bulkSelectMode) const AlbumEditButton(),
          if (albums.bulkSelectMode)
            const AlbumCreateCollectionButton(),
          if (albums.bulkSelectMode)
            const AlbumDeleteBulkButton(),
        ],
      );
    });
  }
}
