// ignore_for_file: unused_element

import 'package:flutter/material.dart';

/**
 * gridview.count with containers list
 * gridview.builder with card and inkwell
 */

class GridViewExample extends StatelessWidget {
  final List<Widget> containers = [
    Container(
      padding: EdgeInsets.all(8),
      child: Text("He'd have you all unravel at the"),
      color: Colors.teal[100],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Heed not the rabble'),
      color: Colors.teal[200],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Sound of screams but the'),
      color: Colors.teal[300],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Who scream'),
      color: Colors.teal[400],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Revolution is coming...'),
      color: Colors.teal[500],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Revolution, they...'),
      color: Colors.teal[600],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Who scream'),
      color: Colors.teal[400],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Revolution is coming...'),
      color: Colors.teal[500],
    ),
    Container(
      padding: EdgeInsets.all(8),
      child: Text('Revolution, they...'),
      color: Colors.teal[600],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
