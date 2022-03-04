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
    return const MaterialApp(
      title: 'Record Cataloguer',
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

  // List<AlbumModel> albums = [
  //   AlbumModel(
  //     // albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'first album',
  //       albumPrice: 10.00,
  //       albumQuantity: 1,
  //       upc: BigInt.from(123456),
  //       scannedDate: DateTime.now()),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'second album',
  //       albumPrice: 15.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     // albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'third album',
  //       albumPrice: 25.00,
  //       albumQuantity: 1,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'fourth album',
  //       albumPrice: 35.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     // albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'fifth album',
  //       albumPrice: 20.00,
  //       albumQuantity: 1,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'sixth album',
  //       albumPrice: 25.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'seventh album',
  //       albumPrice: 15.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     // albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'eighth album',
  //       albumPrice: 25.00,
  //       albumQuantity: 1,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'ninth album',
  //       albumPrice: 35.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     // albumImage: Image.asset('images/diamond.png'),
  //       albumImage: 'diamond.png',
  //       albumArtist: 'ArtistName',
  //       albumName: 'tenth album',
  //       albumPrice: 20.00,
  //       albumQuantity: 1,
  //       upc: BigInt.from(123456)),
  //   AlbumModel(
  //     //  albumImage: Image.asset('images/diamond.png'),
  //       albumImage: '',
  //       albumArtist: 'ArtistName',
  //       albumName: '11th album',
  //       albumPrice: 25.00,
  //       albumQuantity: 5,
  //       upc: BigInt.from(123456)),
  // ];
  //
  // _addNewAlbum(String artist, String album){
  //   final newAlbum = AlbumModel(albumImage: '', albumArtist: artist, albumName: album, albumPrice: 0, albumQuantity: 1, upc: BigInt.from(0));
  //   setState(() {
  //     albums.add(newAlbum);
  //   });
  // }

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
            BackButton(color: Colors.red, onPressed: () => { const AlertDialog(title: Text('ALERT!!!!!'),)},)
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


// TODO: THIS IS THE BARCODE SCANNER SAMPLE CODE FROM THE DOCUMENTATION
// class _MyAppState extends State<MyApp> {
//   String _scanBarcode = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Barcode scan')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: Text('Start barcode scan')),
//                         ElevatedButton(
//                             onPressed: () => scanQR(),
//                             child: Text('Start QR scan')),
//                         ElevatedButton(
//                             onPressed: () => startBarcodeScanStream(),
//                             child: Text('Start barcode scan stream')),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: TextStyle(fontSize: 20))
//                       ]));
//             })));
//   }
// }