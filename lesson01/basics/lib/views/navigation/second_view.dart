import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second View'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(height: 10),
              Text('Second View'),
            ],
          ),
        ));
  }
}
