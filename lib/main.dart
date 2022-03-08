import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
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

  // void openAddAlbumModal(BuildContext ctx) {
  //   showModalBottomSheet(context: ctx, builder: (_) {
  //     return AddAlbumWidget(_addNewAlbum('artist', 'album'));
  //   },);
  // }


  var isApiTesting = false;
  switchScreenToAPI(){
    setState(() {
      isApiTesting = !isApiTesting;
    });
  }

  testEbayApi() {
    // todo: Create API service for HTTP
    // final url = Uri.parse('http://localhost:8080/test');
    // http.get(url);
    // https://developer.ebay.com/api-docs/buy/browse/resources/item_summary/methods/search
    final url = Uri.parse('https://developer.ebay.com/api-docs/buy/browse/resources/item_summary/methods/search');
    http.get(url).then((response) => print('response: ' + response.toString()));
  }

  @override
  Widget build(BuildContext context) {
    // // Can tell if the keyboard is currently on screen
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      // keep the keyboard from causing overflow when displayed
      resizeToAvoidBottomInset: false,
        appBar: AppBar(

          actions: <Widget>[
            FloatingActionButton(
              child: const FittedBox(child: Text('API Testing')),
              onPressed: switchScreenToAPI,
            )
          ],
          title: const Text('Record Cataloguer!'),
        ),
        body: !isApiTesting
            ?
        const AlbumListScreen()
            :
        Column(children: [
          Text('Page for testing Ebay API'),
          AddAlbumWidget(testEbayApi),
        ],),
        );
  }
}