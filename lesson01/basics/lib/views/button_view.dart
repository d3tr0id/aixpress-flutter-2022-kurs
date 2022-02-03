import 'package:flutter/material.dart';
/**
 * Floating Action Button, TextButton, ElevatedButton, OutlinedButton
 * GestureDetector, onPressed extraction
 */

class ButtonView extends StatelessWidget {
  onPressed() {
    print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                child: Text('Click'),
              ),
              ElevatedButton.icon(
                onPressed: onPressed,
                label: Text('Click'),
                icon: Icon(Icons.beach_access),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onPressed,
                  label: Text('Click'),
                  icon: Icon(Icons.beach_access),
                ),
              ),
              TextButton(onPressed: onPressed, child: Text('Click')),
              IconButton(onPressed: onPressed, icon: Icon(Icons.adb_rounded)),
              SizedBox(
                height: 75,
                child:
                    OutlinedButton(onPressed: onPressed, child: Text('Click')),
              ),
              GestureDetector(
                onTap: onPressed,
                child: FlutterLogo(
                  size: 100,
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.add_a_photo),
        ));
  }
}
