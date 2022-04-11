import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album_list_model.dart';
import 'package:record_cataloguer/screens/my_albums_screen.dart';
import 'data/album_list_data.dart';

import 'model/album.dart';

///PROVIDERS
///Model is the ChangeNotifier
///ChangeNotifier
///

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlbumListModel(albumList)),
      ],
      // register changeNotifier
      child: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    // Album List State Hoisted

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
          )),
      home: ChangeNotifierProvider( // NotifierProvider goes on the PARENT of the child/children that need the data
        create: (context) => AlbumListModel(albumList),
        child: MyAlbumsScreen(),
      )
    );
  }
}
