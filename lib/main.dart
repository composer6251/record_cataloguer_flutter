import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:record_cataloguer/model/album_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp>{

  List<AlbumModel> albums = [
    AlbumModel(
        albumImage: Image.asset('images/diamond.png'),
        albumName: 'first album', albumPrice: 10.00,
        upc: BigInt.from(123456)
    ),
    AlbumModel(
        albumImage: Image.asset('images/diamond.png'),
        albumName: 'second album', albumPrice: 10.00,
        upc: BigInt.from(123456)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Album Cataloguer',
      home: Column(
        children: albums.map((album) {
          return Row(
            children: [
              Text(album.albumName),
              Text(album.albumPrice.toString()),
            ],
          );
        }).toList(),
      ),
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