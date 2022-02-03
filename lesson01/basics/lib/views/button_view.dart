import 'package:flutter/material.dart';
/**
 * Floating Action Button, TextButton, ElevatedButton (.icon, double.infinity)
 * OutlinedButton
 * GestureDetector with FlutterLogo
 * onPressed extraction
 */

class ButtonView extends StatelessWidget {
  onPressed() {
    print('onPressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      // floatingActionButtonLocation:
    );
  }
}
