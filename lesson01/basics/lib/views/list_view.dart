// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

/**
 * static listview
 * listview.builder
 * listview.separated
 */

class ListViewExample extends StatelessWidget {
  // List<Widget> widgets = List.generate(
  // 100, (index) => Text('$index', style: TextStyle(fontSize: 40)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: index % 2 == 0 ? Colors.white : Colors.grey,
              title: Text('$index'),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 100),
    );
  }
}
