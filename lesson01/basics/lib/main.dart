// ignore_for_file: unused_import

import 'package:counter/views/appbar_view.dart';
import 'package:counter/views/bottom_nav/bottomnav_view.dart';
import 'package:counter/views/bottom_nav/home_view.dart';
import 'package:counter/views/button_view.dart';
import 'package:counter/views/column_view.dart';
import 'package:counter/views/counter_view.dart';
import 'package:counter/views/drawer_view.dart';
import 'package:counter/views/grid_view.dart';
import 'package:counter/views/icon_view.dart';
import 'package:counter/views/image_view.dart';
import 'package:counter/views/inputs_checkbox_view.dart';
import 'package:counter/views/inputs_switch_view.dart';
import 'package:counter/views/list_view.dart';
import 'package:counter/views/navigation/first_view.dart';
import 'package:counter/views/navigation/second_view.dart';
import 'package:counter/views/row_view.dart';
import 'package:counter/views/scroll_view.dart';
import 'package:counter/views/tabbar_view.dart';
import 'package:counter/views/text_view.dart';
import 'package:counter/views/textfield_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kurs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawerView(),
      // initialRoute: '/first',
      routes: {
        '/first': (context) => FirstView(),
        '/second': (context) => SecondView(),
      },
    );
  }
}
