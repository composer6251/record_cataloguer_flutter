
import 'package:flutter/cupertino.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * Instantiates ListView which accepts List<AlbumModel>
 *
 * CRUD methods for updating given list
 */

class AlbumListModel extends ChangeNotifier {
  final List<AlbumModel> _albums;

  AlbumListModel(this._albums);

  get albumsList => _albums;

  // CRUD ops
  void add(AlbumModel album) {
    // insert at beginning
    _albums.insert(0, album);
    notifyListeners();
  }
  // add all

// delete

// update
}
