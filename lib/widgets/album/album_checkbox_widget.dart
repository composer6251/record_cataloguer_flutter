import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/models/album.dart';
import 'package:record_cataloguer/providers/all_albums_list_provider.dart';

class AlbumCheckBox extends StatefulWidget {
  const AlbumCheckBox({
    Key? key,
    required this.album,
  }) : super(key: key);

  final AlbumModel album;

  @override
  State<AlbumCheckBox> createState() => _AlbumCheckBoxState();
}

class _AlbumCheckBoxState extends State<AlbumCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool? value) {
        print('checkbox isChecked before setState: ' + isChecked.toString());
        print('checkbox on change value: ' + value.toString());
        setState(() {
          isChecked = value!;
        });
        print('checkbox isChecked after setState: ' + isChecked.toString());
        isChecked
            ? Provider.of<AlbumListModel>(context, listen: false)
                .addToTemporaryAlbumCollection(widget.album)
            : Provider.of<AlbumListModel>(context, listen: false)
                .temporaryAlbumCollection
                .remove(widget.album);
      },
    );
  }
}
