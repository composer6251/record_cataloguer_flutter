

import 'package:flutter/material.dart';
import 'package:record_cataloguer/data/album_list_data.dart';
import 'package:record_cataloguer/model/album.dart';
import 'package:record_cataloguer/widgets/album_list_widget.dart';

class SearchAlbums extends SearchDelegate {
  // Handles return to page
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
      ),
      onPressed: () => close(context, null), // close search bar
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          else {
            query = '';
          }
        },
      )
    ];
  }

  // Result calculated on submission
  @override
  Widget buildResults(BuildContext context) {
    List<AlbumModel> searchedAlbums = albumList.where((album) => album.albumName.toLowerCase().contains(query.toLowerCase())).toList();
    return AlbumListWidget(searchedAlbums);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<AlbumModel> testAlbums = albumList.where((album) => album.albumName.toLowerCase().contains(query.toLowerCase()) || album.albumArtist.toLowerCase().contains(query.toLowerCase())).toList();
    return AlbumListWidget(testAlbums);
  }
}