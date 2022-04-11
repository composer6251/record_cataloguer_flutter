import 'dart:collection';

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

  //Instantiates ListView which accepts List<AlbumModel>
  // UnmodifiableListView<AlbumModel> get albums => UnmodifiableListView(_albums);

  get albumList => _albums;

  // CRUD ops
  void add(AlbumModel album) {
    _albums.add(album);
    notifyListeners();
  }
  // add all

// delete

// update
}
