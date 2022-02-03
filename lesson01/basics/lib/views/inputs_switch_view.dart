import 'package:flutter/material.dart';

/**
 * Toggles and sliders
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
      children: [
        ...settings.map((setting) => ListTile(
              title: Text(setting.title),
              trailing: Switch.adaptive(
                value: setting.isToggled,
                onChanged: (value) => setState(() {
                  setting.isToggled = value;
                }),
              ),
            )),
        Text(
          'Price',
          style: TextStyle(fontSize: 20),
        ),
        Slider(
          min: 0,
          max: 10,
          divisions: 5,
          label: price.value.ceil().toString() + ' €',
          value: price.value,
          onChanged: (value) => setState(() {
            price.value = value;
          }),
        )
      ],
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
