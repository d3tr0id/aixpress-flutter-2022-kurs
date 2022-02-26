import 'package:flutter/material.dart';
/**
 * Center, Text, Container, SizedBox, FittedBox
 * Styling
 * Multiline
 * Overflow
 */

class TextView extends StatelessWidget {
  const TextView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber[300],
          child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/first'),
              child: Text('Next Page')),
        ),
      ),
    );
  }
}
