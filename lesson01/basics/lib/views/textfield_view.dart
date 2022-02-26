import 'package:flutter/material.dart';

/**
 * Textfield, controller, dialog, character count
 * onfocus change FocusScope.of(context).unfocus();
 */

class TextFieldView extends StatefulWidget {
  const TextFieldView({Key key}) : super(key: key);

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextField(),
    ));
  }
}
