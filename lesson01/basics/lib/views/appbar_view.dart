import 'package:flutter/material.dart';
/**
 * AppBar, title, leading, centerTitle, actions, bottom
 */

class AppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        bottom: PreferredSize(
            child: Text('Bottom of AppBar'),
            preferredSize: Size.fromHeight(100)),
      ),
    );
  }
}
