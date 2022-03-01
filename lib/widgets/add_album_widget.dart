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
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Artist',
              floatingLabelStyle: TextStyle(
              fontFamily: 'Times New Roman'
          )),
          controller: artistNameController,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Album',
            floatingLabelStyle: TextStyle(
                fontFamily: 'Calibri',
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto
          ),
          controller: albumNameController,
        ),
        ElevatedButton(onPressed: () => print("New album entered"), child: Text("Submit"))
      ],
    );
  }
}
