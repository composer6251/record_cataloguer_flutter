import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:record_cataloguer/screens/my_albums_screen.dart';

/***
 *
 * Entry screen to the app. Displays the nav options to user for viewing lists of albums
 * --- All albums
 * --- Favorites
 * --- My Custom List 1
 * --- My Custom List 2
 */

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void navigateToMyAlbums(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MyAlbumsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                  text: 'My Albums',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { navigateToMyAlbums(context); }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
