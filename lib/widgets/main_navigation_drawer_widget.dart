import 'package:flutter/material.dart';

class MainNavigationDrawer extends StatelessWidget {
  const MainNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Navigation Menu'),
            ),
            ListTile(
              title: Text('List Tile 1'),
            ),
            ListTile(
              title: Text('List Tile 2'),
            ),
          ],
        ),
      ),
    );
  }
}