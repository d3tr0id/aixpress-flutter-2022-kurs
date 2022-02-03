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
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Widget'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("It's cloudy here"),
                if (_controller.index < _controller.length)
                  TextButton(
                      onPressed: () =>
                          _controller.animateTo(++_controller.index),
                      child: Text('Next Page'))
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("It's rainy here"),
                if (_controller.index < _controller.length)
                  TextButton(
                      onPressed: () =>
                          _controller.animateTo(++_controller.index),
                      child: Text('Next Page'))
              ],
            ),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
