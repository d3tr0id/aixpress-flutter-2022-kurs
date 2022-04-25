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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> todos = [];
  List<String> dones = [];

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _showAlert() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Erstelle Todo'),
              content: TextField(controller: _textEditingController),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      todos.add(_textEditingController.text);
                    });
                    _textEditingController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Erstelle'),
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (todos.isNotEmpty) Text('Todos', style: TextStyle(fontSize: 30)),
          ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      dones.add(todos[index]);
                      todos.remove(todos[index]);
                    });
                  },
                  title: Text(todos[index]),
                  leading: Icon(Icons.check_box_outline_blank),
                );
              }),
          Text('Dones', style: TextStyle(fontSize: 30)),
          ListView.builder(
              shrinkWrap: true,
              itemCount: dones.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      todos.add(dones[index]);
                      dones.remove(dones[index]);
                    });
                  },
                  title: Text(dones[index]),
                  leading: Icon(Icons.check_box_outlined),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAlert,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
