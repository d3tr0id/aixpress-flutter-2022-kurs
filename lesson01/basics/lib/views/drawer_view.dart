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
      body: Center(
        child: Text('MainView'),
      ),
    );
  }
}
