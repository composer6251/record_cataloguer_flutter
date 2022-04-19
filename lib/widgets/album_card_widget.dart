//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:record_cataloguer/model/all_albums_list_provider.dart';
// import 'package:record_cataloguer/style/base_font_sizes.dart';
// import 'package:record_cataloguer/style/base_gutter_sizes.dart';
//
// Card AlbumCardWidget(int index) {
//
//   return Card(
//     elevation: 20,
//     child: Padding(
//       padding: const EdgeInsets.all(SMALL_GUTTER),
//       child: Consumer<AlbumListModel>(builder: (context, albums, child) {
//         return Container(
//           //height: 80, // todo: Make card height a setting so more/less albums can fit on a page
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible(
//                 flex: 2,
//                 child: Container(
//                   width: 100.00,
//                   height: 100.00,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image:
//                           // albums.albumsList[index].toString() == ''
//                           // ? const ExactAssetImage(
//                           //     'assets/images/no-image-available.svg.png', // todo: This is breaking upon generating the card because it can't find the image
//                           //     scale: 1,
//                           //   )
//                           // :
//                           ExactAssetImage(
//                         albums.albumsList[index].albumImageUrl,
//                         scale: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Flexible(
//                 flex: 2,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       albums.albumsList[index].albumArtist,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: LARGE_GUTTER,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       albums.albumsList[index].albumName.toUpperCase(),
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: MEDIUM_GUTTER,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Flexible(
//                 flex: 2,
//                 child: Container(
//                     width: 100,
//                     alignment: Alignment.centerRight,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
//                           child: Text(
//                             'x${albums.albumsList[index].albumQuantity}',
//                             style: TextStyle(
//                               fontSize: MEDIUM_FONT,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
//                             child: Text(
//                               '\$${albums.albumsList[index].albumPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
//                           child: Text(
//                             DateFormat.yMMMd()
//                                 .format(albums.albumsList[index].scannedDate),
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 //  mainAxisAlignment: MainAxisAlignment.center, not necessary since mainaxissize is min
//                 children: [
//                   EditAlbumIconWidget(),
//                   !albums.deleteMode
//                       ? DeleteSingleAlbumWidget(widget.)
//                       : DeleteBulkAlbumsCheckboxWidget(albums, index),
//                 ],
//               )
//             ],
//           ),
//         );
//       }),
//     ),
//   );
// }
//
// Flexible EditAlbumIconWidget() {
//   return Flexible(
//     flex: 1,
//     child: IconButton(
//       icon: Icon(
//         Icons.edit,
//       ),
//       onPressed: () => {},
//     ),
//   );
// }
//
// Flexible DeleteSingleAlbumWidget(BuildContext context) {
//   return Flexible(
//     flex: 1,
//     child: IconButton(
//       onPressed: () => {},
//       icon: Icon(
//         Icons.delete,
//         color: Colors.red,
//       ),
//     ),
//   );
// }
//
// // todo: Refactor to handle confirm delete popup, and deletion
// deleteSingleAlbum() {}
//
// Flexible DeleteBulkAlbumsCheckboxWidget(AlbumListModel albums, int index) {
//   List albumsToDelete = [];
//   // upon check
//   bool isChecked = false;
//   return Flexible(
//     flex: 1,
//     child: Checkbox(
//       checkColor: Colors.white,
//       value: isChecked,
//       onChanged: (bool? value) {
//         isChecked = !value!;
//         isChecked ? albumsToDelete.add(index) : albumsToDelete.remove(index);
//         print('changing checkbox isChecked: ' + value.toString() +  ' ' + isChecked.toString() + ' and index: ' + index.toString());
//         // call albumListModel directly and pass in albumsToDelete
//         //
//       },
//     ),
//   );
// }
