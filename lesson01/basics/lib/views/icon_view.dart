import 'package:flutter/material.dart';

/**
 * Icon, IconButton, CircleAvatar
 */

class IconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
          // size: 100,
        ),
      ),
    );
  }
}
