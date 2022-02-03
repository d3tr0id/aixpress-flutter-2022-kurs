import 'package:first_layout/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aixpress',
      theme: ThemeData.dark(),
      home: const HomeView(title: 'Home'),
    );
  }
}
