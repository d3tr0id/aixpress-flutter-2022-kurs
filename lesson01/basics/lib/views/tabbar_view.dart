import 'package:flutter/material.dart';

/**
 * default tab controller,
 * custom controller with animate to
 */

class TabBarViewExample extends StatefulWidget {
  @override
  State<TabBarViewExample> createState() => _TabBarViewExampleState();
}

class _TabBarViewExampleState extends State<TabBarViewExample>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Widget'),
      ),
    );
  }
}
