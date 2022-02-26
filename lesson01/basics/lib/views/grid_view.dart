// ignore_for_file: unused_element

import 'package:flutter/material.dart';

/**
 * gridview.count
 * gridview.builder
 */

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _gridViewBuilder() {}

    return Scaffold(
        body: GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
          ...List.generate(
              20,
              (index) => Card(
                    child: Center(child: Text('$index')),
                  ))
        ]));
  }
}
