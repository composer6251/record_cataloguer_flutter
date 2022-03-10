import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/api/api_urls.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';
import 'package:record_cataloguer/screens/album_list_screen.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Record Cataloguer',
      theme: ThemeData(
       primarySwatch: Colors.blue,
       fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      // theme: ThemeData.from(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
      // ),
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

  void _addNewAlbum(String artist, String album, DateTime date){

    // todo: Create API service for HTTP
    // final url = Uri.parse('http://localhost:8080/test');
    // http.get(url);

    if(artist == '' || album == ''){
      // todo: Save input text if erroring out
      showAlertDialog(context);
      return;
    }
    final newAlbum = Album(
        albumImage: '',
        albumArtist: artist,
        albumName: album, albumPrice: 0,
        albumQuantity: 1,
        upc: BigInt.from(0),
        scannedDate: date);

    // setState(() {
    //   albums.add(newAlbum);
    // });
  }


  // void openAddAlbumModal(BuildContext ctx) {
  //   showModalBottomSheet(context: ctx, builder: (_) {
  //     return AddAlbumWidget(_addNewAlbum('artist', 'album', DateTime.now()));
  //   },);
  // }


  var isApiTesting = false;
  _switchScreenToAPI(){
    setState(() {
      isApiTesting = !isApiTesting;
    });
  }

  _testAddNewAlbum() {
  // todo: Get creds from ebay
    http.post(
        Uri.parse(ebaySandboxAuthorizationApiUrl),
        headers: <String, String> {
          'Content-Type': 'application/s-www-form-urlencoded',
          'Authorization': "Basic "
        }
    ).then((response) => print(
        'API response code: ' + response.statusCode.toString() +
            '\nand body: ' + response.body));
  }

  @override
  Widget build(BuildContext context) {
    // // Can tell if the keyboard is currently on screen
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      // keep the keyboard from causing overflow when displayed
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {},
            backgroundColor: Colors.green,
          ),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: const FittedBox(child: Text('API Testing')),
              onPressed: _switchScreenToAPI,
            ),
          ],
          title: const Text('Record Cataloguer!'),
        ),
        body: !isApiTesting
            ?
        const AlbumListScreen()
            :
        Column(children: [
          Text('Page for testing Ebay API'),
          AddAlbumWidget(_testAddNewAlbum),
        ],),
        );
  }
}