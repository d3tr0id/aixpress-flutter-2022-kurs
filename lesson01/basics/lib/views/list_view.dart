// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

/**
 * static listview
 * listview.builder
 * listview.separated
 */

class ListViewExample extends StatelessWidget {
  final List<int> colorCodes = <int>[600, 500, 100];
  final List<int> entries = List.generate(3, (index) => index);

  @override
  Widget build(BuildContext context) {
    //
    Widget builder = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
    Widget sepBuilder = ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });

    Widget staticListView = ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );

    return Scaffold(body: sepBuilder);
  }
}
