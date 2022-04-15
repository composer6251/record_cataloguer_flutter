import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
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
          // todo: Make this a bulk delete button
          // todo: add select all to mass delete. Should I make this ONLY on search? So noone inadvertantly deletes ALL their albums
          ElevatedButton(
            child: Icon(
              Icons.delete,
              size: 25,
            ),
            onPressed: () => {
              albums.setDeleteMode(!albums.deleteMode)
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
