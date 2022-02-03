import 'package:flutter/material.dart';

/**
 * Toggles and sliders
 * Setting Model, MySlider Model
 * Column ListTile with Switch from settings.map()
 * Slider with Model
 */

class InputsSwitchView extends StatefulWidget {
  @override
  State<InputsSwitchView> createState() => _InputsSwitchViewState();
}

class _InputsSwitchViewState extends State<InputsSwitchView> {
  List<Setting> settings = [
    Setting('Anonymous Mode'),
    Setting('Data Usage'),
    Setting('Location')
  ];

  MySlider price = MySlider('Price in €');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    ));
  }
}

class Setting {
  bool isToggled = false;
  String title;

  Setting(this.title);
}

class MySlider {
  double value = 0;
  String title;

  MySlider(this.title);
}
