import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:record_cataloguer/model/album.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<AlbumModel> albums = [
    AlbumModel(
        // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'first album',
        albumPrice: 10.00,
        albumQuantity: 1,
        upc: BigInt.from(123456),
        scannedDate: DateTime.now()),
    AlbumModel(
        //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'second album',
        albumPrice: 15.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
    AlbumModel(
        // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'third album',
        albumPrice: 25.00,
        albumQuantity: 1,
        upc: BigInt.from(123456)),
    AlbumModel(
        //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'fourth album',
        albumPrice: 35.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
    AlbumModel(
        // albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'fifth album',
        albumPrice: 20.00,
        albumQuantity: 1,
        upc: BigInt.from(123456)),
    AlbumModel(
        //  albumImage: Image.asset('images/diamond.png'),
        albumImage: 'diamond.png',
        albumName: 'sixth album',
        albumPrice: 25.00,
        albumQuantity: 5,
        upc: BigInt.from(123456)),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album Cataloguer',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Record Cataloguer!'),
        ),
        body: Column(
          children: albums.map((album) {
            return Container(
              height: 100,
              child: Card(
                elevation: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //  child: Image(),
                      // todo: Add image
                      child: const Text('I am an IMAGE!!!!'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(album.albumName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(DateFormat.yMMMd().format(DateTime.now())),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey, width: 2),
                              borderRadius: const BorderRadius.all(Radius.elliptical(1, 10)),
                            ),
                            child: Text(
                              '\$${album.albumPrice}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )
                        ),
                      ],
                    ),
                    Container(
                        width: 100,
                        alignment: Alignment.centerRight,
                        child: Text('x${album.albumQuantity}', style: const TextStyle(fontSize: 20),
                        )
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
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