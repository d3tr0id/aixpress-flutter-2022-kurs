// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

/**
 * singlechildscrollview, column, list.generate children
 */

class ScrollViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
            children: List.generate(
                100, (index) => ListTile(title: Text('Index: $index')))),
      ),
    ));
  }
}
