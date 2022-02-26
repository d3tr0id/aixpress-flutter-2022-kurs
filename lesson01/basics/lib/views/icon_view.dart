import 'package:flutter/material.dart';

/**
 * Icon, IconButton, CircleAvatar
 */

class IconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircleAvatar(
        backgroundColor: Colors.yellow,
        radius: 50,
        child: Icon(Icons.assignment_return_outlined,
            size: 100, color: Colors.red),
      ),
    ));
  }
}
