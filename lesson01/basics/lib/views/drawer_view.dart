import 'package:flutter/material.dart';

/**
 * Drawer, DrawerHeader, pushNamed onTap ListTile
 */

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('FirstView'),
              onTap: () {
                Navigator.pushNamed(context, '/first');
                // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('SecondView'),
              onTap: () {
                Navigator.pushNamed(context, '/second');
                // Navigator.pop(context); // close the drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('MainView'),
      ),
    );
  }
}
