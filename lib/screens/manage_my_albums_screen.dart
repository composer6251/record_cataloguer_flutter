//
// import 'dart:math';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:record_cataloguer/screens/api_testing_screen.dart';
// import 'package:record_cataloguer/screens/my_albums_screen.dart';
// import 'package:record_cataloguer/widgets/add_album_widget.dart';
// import 'package:record_cataloguer/widgets/album_list_widget.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../model/album.dart';
// import '../data/love_notes.dart';
//
// /***
//  * This class holds the album list state and injects the album data into the AlbumListWidget
//  *
//  * Widget chart: main.dart => AlbumListView => AlbumListWidget
//  *
//  */
// class ManageMyAlbumsScreen extends StatefulWidget {
//   const ManageMyAlbumsScreen({Key? key}) : super(key: key);
//
//   @override
//   _ManageMyAlbumsScreenState createState() => _ManageMyAlbumsScreenState();
// }
//
// class _ManageMyAlbumsScreenState extends State<ManageMyAlbumsScreen> {
//     List<AlbumModel> albums = [];
//     List<int> usedIndices = [];
//
//   showAlertDialog(BuildContext ctx){
//
//     AlertDialog alert = const AlertDialog(
//       title: Text('Error'),
//       content: Text('Please complete both Artist and Album fields before submitting'),
//     );
//
//     showDialog(
//         context: ctx,
//         builder: (BuildContext context) {
//           return alert;
//         }
//     );
//   }
//
//   void _addNewAlbum(String artist, String album, DateTime date){
//
//     if(artist == '' || album == ''){
//       // todo: Save input text if erroring out
//       showAlertDialog(context);
//       return;
//     }
//     final newAlbum = AlbumModel(
//         albumImageUrl: '',
//         albumArtist: artist,
//         albumName: album, albumPrice: 0,
//         albumQuantity: 1,
//         upc: BigInt.from(0),
//         scannedDate: date);
//
//     setState(() {
//       albums.insert(0, newAlbum);
//     });
//   }
//
//   openAddAlbumModal(BuildContext ctx) {
//     showModalBottomSheet(clipBehavior: Clip.hardEdge, context: ctx, builder: (_) {
//       return AddAlbumWidget();
//     },);
//   }
//
//   navigateToMyAlbumsScreen(BuildContext ctx) {
//     Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//       return MyAlbumsScreen();
//     }));
//   }
//
//   navigateToApiTestingScreen(BuildContext ctx) {
//     Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
//       return const ApiTestingScreen();
//     }));
//   }
//
//   void _showToast(BuildContext ctx) {
//     int nextRandom;
//     if (usedIndices.length == notes.length){
//       usedIndices = [];
//       print('usedIndices length: ' + usedIndices.length.toString());
//     }
//     final _random = Random();
//     do {
//       nextRandom = _random.nextInt(notes.length);
//     }
//     while (usedIndices.contains(nextRandom));
//     usedIndices.add(nextRandom);
//     String quote = notes[nextRandom];
//     Fluttertoast.showToast(
//       msg: quote,
//       gravity: ToastGravity.CENTER,
//       backgroundColor: Colors.red,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               flex: 1,
//               child: ElevatedButton(
//                 child: const FittedBox(
//                     child: Text(
//                       'API Testing'
//                     )
//                 ),
//                 onPressed: () => navigateToApiTestingScreen(context),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//               ),
//             ),
//             Flexible(
//               flex: 2,
//               child: const Text(
//                 'Manage Albums'
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: ElevatedButton(
//                 child: const Text(
//                   'View Albums',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () => navigateToMyAlbumsScreen(context),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.green,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         margin: const EdgeInsets.only(left: 20, right: 20),
//         child: SingleChildScrollView(
//           child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => {
//                         openAddAlbumModal(context)
//                       },
//                       child: Text('Add'),
//                     ),
//                     OutlinedButton(
//                       onPressed: () => {  },
//                       child: const Text(
//                         'Scan Albums'
//                       ),
//                     ),
//                     // IconButton(
//                     //   iconSize: 40,
//                     //   color: Colors.pinkAccent,
//                     //   icon: const Icon(
//                     //     Icons.favorite_rounded,
//                     //   ),
//                     //   onPressed: () => _showToast(context),
//                     // )
//                   ],
//                 ),
//                 AlbumListWidget(albums),
//               ],
//             ),
//         ),
//       ),
//     );
//   }
// }
