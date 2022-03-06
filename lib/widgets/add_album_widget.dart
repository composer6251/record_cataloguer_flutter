import 'package:flutter/material.dart';

/***
 * This class is used to manually enter an album if scanning fails. It should still reach out to EBAY....etc to get album info.
 */
class AddAlbumWidget extends StatelessWidget {
  final artistNameController = TextEditingController();
  final albumNameController = TextEditingController();
  final Function addNewAlbum;

  AddAlbumWidget(this.addNewAlbum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
  //          fillColor: Theme.of(context).primaryColorDark,
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
                fontFamily: 'Times New Roman',
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto
          ),
          controller: albumNameController,
        ),
        ElevatedButton(
          onPressed: () {
            print('addingNewAlbum' + artistNameController.text + ' ' + albumNameController.text);
            addNewAlbum(artistNameController.text, albumNameController.text);
            FocusManager.instance.primaryFocus?.unfocus();

          },
          child: const Text("Submit"),
      )
      ],
    );
  }
}
