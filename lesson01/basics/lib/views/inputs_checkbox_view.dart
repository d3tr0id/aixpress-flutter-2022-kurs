import 'package:flutter/material.dart';

/**
 * Checkbox list tiles view
 * multi select
 */

class InputsCheckboxView extends StatefulWidget {
  @override
  State<InputsCheckboxView> createState() => _InputsCheckboxViewState();
}

class _InputsCheckboxViewState extends State<InputsCheckboxView> {
  List<MyItem> items = List.generate(20, (index) => MyItem("$index"));

  @override
  Widget build(BuildContext context) {
    bool allSelected =
        items.where((element) => element.isChecked).toList().length ==
            items.length;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                  value: items[index].isChecked,
                  title: Text(items[index].title),
                  onChanged: (_) {
                    setState(() {
                      items[index].isChecked = !items[index].isChecked;
                    });
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        label: Text(allSelected ? 'Deselect All' : 'Select All'),
        icon: allSelected ? Icon(Icons.clear) : Icon(Icons.check),
        onPressed: () {
          setState(() {
            for (var element in items) {
              element.isChecked = !allSelected;
              // allSelected = !allSelected;
            }
          });
        },
      ),
    );
  }
}

class MyItem {
  bool isChecked = false;
  String title;

  MyItem(this.title);
}
