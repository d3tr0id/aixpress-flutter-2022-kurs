import 'package:flutter/material.dart';

/**
 * Icons with Container, Expanded (flex), alignments
 */

class ColumnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.teal,
                  child: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
