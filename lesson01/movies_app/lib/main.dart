import 'package:flutter/material.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aixpress',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeView(),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
