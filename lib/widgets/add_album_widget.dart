
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/model/album_list_model.dart';

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
    print('showing alert dialog');
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

  final _artistNameController = TextEditingController();

  final _albumNameController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _initializeDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) => {
              setState(() {
                _selectedDate = pickedDate!;
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumListModel>(builder: (context, albums, child) {
      return Column(
        children: [
          Flexible(
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Artist',
                  floatingLabelStyle: TextStyle(fontFamily: 'Times New Roman')),
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
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              controller: _albumNameController,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Date Entered:  ${DateFormat.yMd().format(_selectedDate)}'),
                TextButton(
                    onPressed: _initializeDatePicker,
                    child: const Icon(Icons.calendar_today_outlined)),
              ],
            ),
          ),
          Flexible( // todo: pull anon into named function
            child: ElevatedButton(
              onPressed: () {
                (_artistNameController.text == '' ||
                      _albumNameController.text == '')
                  ? showAlertDialog(context)
                  : albums.add(AlbumModel( // todo: find better way to do the image. Default in model? Or bring in picture here and default if no image url?
                      albumId: ++albums.primaryKey,
                      albumImageUrl: 'assets/images/no-image-available.svg.png',
                      albumArtist: _artistNameController.text,
                      albumName: _albumNameController.text,
                      albumPrice: 0.00,
                      albumQuantity: 1,
                      upc: BigInt.zero,
                      scannedDate: _selectedDate));
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      );
    });
  }
}
