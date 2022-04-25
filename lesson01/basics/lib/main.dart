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
  // runApp(const MyApp());
  Person person1 = new Person('Cem');
  // person1.sprechen();

  Person person2 = new Person('Johannes');
  person2.name = 'asdasdas';
  // person2.sprechen();

  List<Person> personen = [person1, person2];

  // personen.map((Person p) => p.sprechen());

  personen.forEach((person) {
    person.sprechen();
  });
}

class Person {
  int anzahlAugen = 2;
  String name;

  Person(String name) {
    this.name = name;
  }

  void sprechen() {
    print('hallo, mein name ist $name');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 2;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Kurs',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hallo'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Das ist unsere App', style: TextStyle(fontSize: 30)),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text('Counter ist: $counter',
                      style: TextStyle(fontSize: 36, color: Colors.red)),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: incrementCounter,
          ),
        ));
  }
}
