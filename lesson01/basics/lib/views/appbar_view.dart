import 'package:flutter/material.dart';
/**
 * AppBar, title, leading, centerTitle, actions, bottom
 */

class AppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('AppBar'),
        leading: Icon(Icons.person),
        actions: [
          IconButton(onPressed: () => print('asd'), icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
