// ignore_for_file: unused_import

import 'package:counter/views/appbar_view.dart';
import 'package:counter/views/button_view.dart';
import 'package:counter/views/column_view.dart';
import 'package:counter/views/counter_view.dart';
import 'package:counter/views/grid_view.dart';
import 'package:counter/views/icon_view.dart';
import 'package:counter/views/image_view.dart';
import 'package:counter/views/list_view.dart';
import 'package:counter/views/row_view.dart';
import 'package:counter/views/scroll_view.dart';
import 'package:counter/views/text_view.dart';
import 'package:counter/views/textfield_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kurs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextFieldView(),
    );
  }
}
