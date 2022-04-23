import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';
import 'package:record_cataloguer/styles/base_font_sizes.dart';


class AlbumEditButton extends StatelessWidget {
  const AlbumEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Edit',
        style: TextStyle(
          fontSize: MEDIUM_FONT,
        ),
      ),
      onPressed: () => {Provider.of<AlbumListModel>(context, listen: false).setBulkSelectMode()},
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 10,
      ),
    );
  }
}