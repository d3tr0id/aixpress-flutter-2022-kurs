import 'package:flutter/material.dart';

/**
 * Drawer, DrawerHeader
 * add onTap pushNamed for ListTile /first, /second
 */

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      drawer: Drawer(
          // child:,
          ),
      body: Center(
        child: Text('MainView'),
      ),
    );
  }
}
