import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/provider/all_albums_list_provider.dart';
import 'package:record_cataloguer/style/base_font_sizes.dart';
import 'package:record_cataloguer/style/base_gutter_sizes.dart';

/****
 * THIS CLASS IS A STATEFUL VERSION OF THE ALBUM_CARD_WIDGET. IT WAS CREATED TO HANDLE THE LOCAL STATE (CHECKBOX) THAT NEEDED UPDATING
 */
class AlbumWidget extends StatefulWidget {
  // takes current album in list from albumListWidget
  late AlbumModel album;
  AlbumWidget(this.album, {Key? key}) : super(key: key);

  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  List albumsToDelete = [];
  // upon check
  bool isChecked = false;

  var _ratingController;

  @override
  Widget build(BuildContext context) {
    print('rebuilding album_widget. Album: ' + widget.album.albumArtist);
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(SMALL_GUTTER),
        child:
            Consumer<AlbumListModel>(builder: (context, albumListModel, child) {
          return Container(
            //height: 80, // todo: Make card height a setting so more/less albums can fit on a page
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.album.albumImageUrl == ''
                            ? const ExactAssetImage(
                                'assets/images/no-image-available.svg.png', // todo: This is breaking upon generating the card because it can't find the image
                                scale: 1,
                              )
                            : ExactAssetImage(
                                widget.album.albumImageUrl,
                                scale: 1,
                              ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.album.albumArtist,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: LARGE_GUTTER,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.album.albumName.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: MEDIUM_GUTTER,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                      width: 100,
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                            child: Text(
                              'x${widget.album.albumQuantity}',
                              style: TextStyle(
                                fontSize: MEDIUM_FONT,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                              child: Text(
                                '\$${widget.album.albumPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // todo: PUT RATING BAR IN ITS PLACE
                          // Padding(
                          //   padding: const EdgeInsets.all(EXTRA_SMALL_GUTTER),
                          //   child: Text(
                          //     DateFormat.yMMMd()
                          //         .format(widget.album.scannedDate),
                          //     style: TextStyle(
                          //       fontStyle: FontStyle.italic,
                          //     ),
                          //   ),
                          // ),
                        ],
                      )),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditAlbumIconWidget(),
                    !albumListModel.bulkSelectMode
                        ? Flexible(
                            flex: 1,
                            child: IconButton(
                              onPressed: () =>
                                  {albumListModel.delete(widget.album)},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : Flexible(
                            flex: 1,
                            child: Checkbox(
                              checkColor: Colors.white,
                              value: albumListModel.albumCollection.isEmpty
                                  ? false // if the albumCollection is empty, then the bulk delete/collection creation has just occurred
                                  : isChecked,
                              onChanged: (bool? value) {
                                print('checkbox on change value: ' + isChecked.toString());
                                setState(() {
                                  isChecked = value!;
                                });
                                isChecked
                                    ? albumListModel.userCollection1
                                        .add(widget.album)
                                    : albumListModel.userCollection1
                                        .remove(widget.album);
                              },
                            ),
                          ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// todo: Can you make these into their own methods, or do they need to be in the tree directly in order to call setState? Or can you return the values?
// todo: Add to delete list in the method, and in the onChanged above, do set State?
Flexible EditAlbumIconWidget() {
  return Flexible(
    flex: 1,
    child: IconButton(
      icon: Icon(
        Icons.edit,
      ),
      onPressed: () => {},
    ),
  );
}

Flexible DeleteSingleAlbumWidget(
    AlbumListModel albumListModel, int indexToDelete) {
  return Flexible(
    flex: 1,
    child: IconButton(
      onPressed: () => {},
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
    ),
  );
}

// todo: Refactor to handle confirm delete popup, and deletion
deleteSingleAlbum() {}

Flexible DeleteBulkAlbumsCheckboxWidget(AlbumListModel albums, int index) {
  List albumsToDelete = [];
  // upon check
  bool isChecked = false;
  return Flexible(
    flex: 1,
    child: Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool? value) {
        isChecked = !value!;
        isChecked ? albumsToDelete.add(index) : albumsToDelete.remove(index);
        print('changing checkbox isChecked: ' +
            value.toString() +
            ' ' +
            isChecked.toString() +
            ' and index: ' +
            index.toString());
        // call albumListModel directly and pass in albumsToDelete
        //
      },
    ),
  );
}
