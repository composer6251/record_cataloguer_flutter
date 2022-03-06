import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';
import 'package:record_cataloguer/widgets/album_list_view.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Record Cataloguer',
      // theme: ThemeData(
      //  primarySwatch: Colors.red,
      //  fontFamily: 'OpenSans'
      // ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // set up alert dialog box
  showAlertDialog(BuildContext ctx){

    AlertDialog alert = const AlertDialog(
      title: Text('Error'),
      content: Text('Please complete both Artist and Album fields before submitting'),
    );

    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  // void openAddAlbumModal(BuildContext ctx) {
  //   showModalBottomSheet(context: ctx, builder: (_) {
  //     return AddAlbumWidget(_addNewAlbum('artist', 'album'));
  //   },);
  // }

  @override
  Widget build(BuildContext context) {
    // // Can tell if the keyboard is currently on screen
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      // keep the keyboard from causing overflow when displayed
      resizeToAvoidBottomInset: false,
        appBar: AppBar(

          actions: <Widget>[
            // BackButton(color: Theme.of(context).primaryColorDark, onPressed: () => {},)
            // IconButton(
            //   // todo: Route to add_album widget onPressed
            //   onPressed: () => {},
            //   icon: Icon(Icons.add_circle_outlined),
            //   iconSize: 40,
            // )
          ],
          title: const Text('Record Cataloguer!'),
        ),
        body: const AlbumListView(),
        );
  }
}