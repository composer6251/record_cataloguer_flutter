import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/***
 * This class is used to manually enter an album if scanning fails. It should still reach out to EBAY....etc to get album info.
 */
class AddAlbumWidget extends StatefulWidget {
  final Function addNewAlbum;

  AddAlbumWidget(this.addNewAlbum, {Key? key}) : super(key: key);

  @override
  State<AddAlbumWidget> createState() => _AddAlbumWidgetState();
}

class _AddAlbumWidgetState extends State<AddAlbumWidget> {
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
        TextField(
          autofocus: true,
          decoration: const InputDecoration(
  //          fillColor: Theme.of(context).primaryColorDark,
            labelText: 'Artist',
            floatingLabelStyle: TextStyle(
            fontFamily: 'Times New Roman'
          )),
          controller: _artistNameController,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Album',
            floatingLabelStyle: TextStyle(
                fontFamily: 'Times New Roman',
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto
          ),
          controller: _albumNameController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text('Date Entered:  ${DateFormat.yMd().format(_selectedDate)}')
            ),
            TextButton(
                onPressed: _initializeDatePicker,
                child: const Icon(Icons.calendar_today_outlined)
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // Testing
          //  widget.addNewAlbum(); //todo: For API Testing
            widget.addNewAlbum(_artistNameController.text, _albumNameController.text, _selectedDate);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
