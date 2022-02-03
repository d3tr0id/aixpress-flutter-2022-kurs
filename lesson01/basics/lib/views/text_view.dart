import 'package:flutter/material.dart';
/**
 * Center, Text, Container, SizedBox, FittedBox
 * Styling
 * Multiline
 * Overflow
 */

class TextView extends StatelessWidget {
  const TextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        child: Text('Das ist ein Beispiel für Text in Flutter!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            )),
      ),
    );
  }
}
