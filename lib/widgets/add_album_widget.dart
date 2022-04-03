import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * This class is used to manually enter an album if scanning fails. It should still reach out to EBAY....etc to get album info.
 */
class AddAlbumWidget extends StatefulWidget {

  AddAlbumWidget({Key? key}) : super(key: key);

  @override
  State<AddAlbumWidget> createState() => _AddAlbumWidgetState();
}

class _AddAlbumWidgetState extends State<AddAlbumWidget> {

  showAlertDialog(BuildContext ctx) {
    AlertDialog alert = const AlertDialog(
      title: Text('Error'),
      content: Text(
          'Please complete both Artist and Album fields before submitting'),
    );

    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _addNewAlbum(String artist, String album, DateTime date) {
    print('adding new album: ' + artist);
    if (artist == '' || album == '') {
      // todo: Save input text if erroring out
      showAlertDialog(context);
      return;
    }
    final newAlbum = Album(
        albumImageUrl: '',
        albumArtist: artist,
        albumName: album,
        albumPrice: 0,
        albumQuantity: 1,
        upc: BigInt.from(0),
        scannedDate: date);

    setState(() {
      albumList.insert(0, newAlbum);
    });
  }

  final _artistNameController = TextEditingController();

  final _albumNameController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _initializeDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now()
    ).then((pickedDate) => {
      setState(() {
      _selectedDate = pickedDate!;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
  //          fillColor: Theme.of(context).primaryColorDark,
              labelText: 'Artist',
              floatingLabelStyle: TextStyle(
              fontFamily: 'Times New Roman'
            )),
            controller: _artistNameController,
          ),
        ),
        Flexible(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Album',
              floatingLabelStyle: TextStyle(
                  fontFamily: 'Times New Roman',
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto
            ),
            controller: _albumNameController,
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date Entered:  ${DateFormat.yMd().format(_selectedDate)}'),
              TextButton(
                  onPressed: _initializeDatePicker,
                  child: const Icon(Icons.calendar_today_outlined)
              ),
            ],
          ),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () =>
             // widget.addNewAlbum, //todo: For API Testing
              _addNewAlbum(_artistNameController.text, _albumNameController.text, _selectedDate),
              // FocusManager.instance.primaryFocus?.unfocus();
            child: const Text("Submit"),
          ),
        ),
      ],
    );
  }
}
