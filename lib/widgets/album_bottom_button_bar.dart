import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/provider/all_albums_list_provider.dart';
import 'package:record_cataloguer/style/base_font_sizes.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({Key? key}) : super(key: key);

  openAddAlbumModal(BuildContext ctx) {
    showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      context: ctx,
      builder: (_) {
        return AddAlbumWidget();
      },
    );
  }

  // todo: Make the buttons animate. Initial state is one EDIT button. Upon click, the 3 below buttons animate
  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumListModel>(builder: (context, albums, child) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
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
          ),
          ElevatedButton(
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
          ),
          if (!albums.bulkSelectMode)
            ElevatedButton(
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: MEDIUM_FONT,
                ),
              ),
              onPressed: () => {albums.setBulkSelectMode()},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(20),
                elevation: 10,
              ),
            ),
          if (albums.bulkSelectMode)
            ElevatedButton(
              child: Icon(
                Icons.bookmark,
                size: 25,
              ),
              onPressed: () => {
                // if bulkSelectMode is on and this is pressed, create the list and switch bulkUpdateMode
                if (albums.albumCollection.isNotEmpty)
                  // todo: Show Confirmation message
                  albums.createAlbumList()
                else
                  albums.setBulkSelectMode()
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(20),
                elevation: 10,
              ),
            ),
          if (albums.bulkSelectMode)
            ElevatedButton(
              child: const Icon(
                Icons.delete,
                size: 25,
              ),
              onPressed: () => {
                // if deleteMode is on and this is pressed, delete the albums, and switch deleteMode, and switch Icon on the button
                if (albums.albumCollection.isNotEmpty)
                  albums.deleteBulk()
                else
                  albums.setBulkSelectMode()
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: const CircleBorder(),
                padding: EdgeInsets.all(20),
                elevation: 10,
              ),
            ),
        ],
      );
    });
  }
}

deleteBulk(AlbumListModel albumListModel) {
  albumListModel.deleteBulk();
}

createAlbumList(AlbumListModel albumListModel) {
  albumListModel.deleteBulk();
}
