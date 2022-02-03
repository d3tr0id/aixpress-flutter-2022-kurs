// ignore_for_file: unused_element

import 'package:flutter/material.dart';

/**
 * gridview.count
 * gridview.builder
 */

class GridViewExample extends StatelessWidget {
  final Widget gridview = GridView.count(
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 2,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text("He'd have you all unravel at the"),
        color: Colors.teal[100],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Heed not the rabble'),
        color: Colors.teal[200],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Sound of screams but the'),
        color: Colors.teal[300],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Who scream'),
        color: Colors.teal[400],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution is coming...'),
        color: Colors.teal[500],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution, they...'),
        color: Colors.teal[600],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Who scream'),
        color: Colors.teal[400],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution is coming...'),
        color: Colors.teal[500],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution, they...'),
        color: Colors.teal[600],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    _gridViewBuilder() {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.teal,
              child: InkWell(
                onTap: () => print('clicked $index'),
                child: Center(child: Text('$index')),
              ),
            );
          });
    }

    return Scaffold(body: gridview);
  }
}
