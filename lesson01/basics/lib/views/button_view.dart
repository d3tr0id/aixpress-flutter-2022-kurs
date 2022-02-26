import 'package:flutter/material.dart';
/**
 * Floating Action Button, TextButton, ElevatedButton, OutlinedButton
 * GestureDetector, onPressed extraction
 */

class ButtonView extends StatelessWidget {
  void clicked() => print('asda');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: clicked, child: Text('Click Me!')),
            Container(
              width: 300,
              child: ElevatedButton.icon(
                  onPressed: clicked,
                  label: Text('Click Me!'),
                  icon: Icon(Icons.ad_units)),
            ),
            TextButton(onPressed: clicked, child: Text('Nur text')),
            OutlinedButton(onPressed: clicked, child: Text('Click')),
            GestureDetector(
              onTap: clicked,
              child: FlutterLogo(
                size: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
