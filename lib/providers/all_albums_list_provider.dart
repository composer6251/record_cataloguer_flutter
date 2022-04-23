
import 'package:flutter/cupertino.dart';
import 'package:record_cataloguer/models/album.dart';

/***
 * Instantiates ListView which accepts List<AlbumModel>
 *
 * CRUD methods for updating given list
 */

class AlbumListModel extends ChangeNotifier {
  final List<AlbumModel> _allAlbumsList;
  List<AlbumModel>? _searchedAlbums;
  bool _bulkSelectMode = false; // Bulk delete indicator
  bool _createCollectionMode = false; // Creating collection Indicator
  int primaryKey;
  // List<int> albumCollectionIds = []; //was for deleting by id instead of object
  List<AlbumModel> temporaryAlbumCollection = [];
  List<AlbumModel> userCollection1 = [];

  AlbumListModel(this._allAlbumsList, this.primaryKey);

  get allAlbumsList => _allAlbumsList;
  get bulkSelectMode => _bulkSelectMode;

  // CRUD ops
  void add(AlbumModel album) {
    print('albums provider add single album');
    // insert at beginning
    _allAlbumsList.insert(0, album);
    notifyListeners();
  }

  void delete(AlbumModel albumToDelete) {
    print('albums provider delete single album');
    _allAlbumsList.remove(albumToDelete);
    notifyListeners();
  }

  void setBulkSelectMode(){
    _bulkSelectMode = !_bulkSelectMode;
    print('bulkSelectMode set to ' + _bulkSelectMode.toString());
    notifyListeners();
  }

  void deleteBulk(){
    validateCollection();
    print("removing bulk albums");
    _allAlbumsList.map((album) => delete(album));
    setBulkSelectMode();
 //   _allAlbumsList.removeWhere((album) => albumCollectionIds.contains(album.albumId));
    notifyListeners();
  }

  // USER CREATING ALBUM LISTS
  void createAlbumList(){
    validateCollection();
    print('creating new album list');
    userCollection1 = temporaryAlbumCollection;
    setBulkSelectMode();
    notifyListeners();
    print('created album collection of size: ' + userCollection1.length.toString());
  }

  void validateCollection() {
    if(temporaryAlbumCollection.isEmpty){
      print('no albums in collection for create or delete');
      setBulkSelectMode();
      notifyListeners();
    }
  }

}
