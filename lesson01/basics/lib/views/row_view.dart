import 'package:flutter/material.dart';

/**
 * Icons with Container, Expanded (flex), alignments
 */

class RowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue,
              child: Icon(Icons.car_rental),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.lightGreen,
              child: Icon(Icons.beach_access),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.teal,
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
