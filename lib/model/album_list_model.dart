
import 'package:flutter/cupertino.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * Instantiates ListView which accepts List<AlbumModel>
 *
 * CRUD methods for updating given list
 */

class AlbumListModel extends ChangeNotifier {
  final List<AlbumModel> _albums;
  List<AlbumModel>? _searchedAlbums;
  bool _deleteMode = false;

  AlbumListModel(this._albums);

  get albumsList => _albums;
  get deleteMode => _deleteMode;

  // CRUD ops
  void add(AlbumModel album) {
    // insert at beginning
    _albums.insert(0, album);
    notifyListeners();
  }

  void delete(int indexToDelete) {
    _albums.removeAt(indexToDelete);
    notifyListeners();
  }

  void setDeleteMode(bool mode){
    _deleteMode = mode;
    notifyListeners();
  }

  // SEARCH ops
  // todo: Is it best to keep the searched albums here? You used to pass them into albumListWidget, but that now uses provider
  void updateSearchedAlbums(){

  }

}
