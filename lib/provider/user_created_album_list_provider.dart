import 'package:flutter/cupertino.dart';
import 'package:record_cataloguer/model/album.dart';

/***
 * This is the provider for the user lists created from their album catalogue by:
 * Manually adding albums to a list
 * Or grouped by album rating
 */

class UserCreatedAlbumListProvider extends ChangeNotifier {
  final List<AlbumModel> _userAlbumList1;


  UserCreatedAlbumListProvider(this._userAlbumList1);

}