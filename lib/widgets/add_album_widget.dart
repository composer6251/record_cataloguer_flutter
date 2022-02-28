import 'package:flutter/material.dart';

/***
 * This class is used to manually enter an album if scanning fails. It should still reach out to EBAY....etc to get album info.
 */
class AddAlbumWidget extends StatelessWidget {
  AddAlbumWidget({Key? key}) : super(key: key);


  final artistNameController = TextEditingController();
  final albumNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: artistNameController,
          ),
          TextField(
            controller: albumNameController,
          ),
          ElevatedButton(onPressed: () => print("New album entered"), child: Text("Submit"))
        ],
      ),
    );
  }
}
