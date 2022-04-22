import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // In diesen beiden Arrays sollen jeweils die Todos und Done String
  // gespeichert werden
  List<String> todos = [];
  List<String> done = [];

  // Dieser Controller wird benötigt für das TextField im AlertDialog
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showCreateTodoDialog() {
      // Der Alert Dialog soll ein TextField und zwei Buttons 'Cancel'
      // und 'Create'enthalten
      return showDialog(
          context: context,
          builder: (context) {
            // Dialog braucht title, content und actions Parameter
            // Sobald der Create Button geklickt wird soll
            return AlertDialog();
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Hier brauchen wir einen body der in einer Column die Todos und Erledigten
      // Aufgaben in Form von ListTile Widgets enthält
      floatingActionButton: FloatingActionButton(
        // onpressed Parameter soll Dialog aufrufen
        tooltip: 'New Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
