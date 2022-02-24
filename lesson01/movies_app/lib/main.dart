import 'package:flutter/material.dart';
import 'package:movies_app/ui/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aixpress',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeView(),
    );
  }
}
