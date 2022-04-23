import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/models/album.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';

class DeleteAlbumWidget extends StatelessWidget {
  const DeleteAlbumWidget({
    Key? key,
    required this.album,
  }) : super(key: key);

  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        Provider.of<AlbumListModel>(context, listen: false).deleteAlbum(album) // The button doesn't need to rebuild, it just needs call the provider method
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
