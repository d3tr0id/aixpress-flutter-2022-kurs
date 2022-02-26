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
  List<String> todos = [];
  List<String> done = [];
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addTodo(String todo) {
    if (todo.isNotEmpty) {
      setState(() {
        todos.add(todo);
        _textEditingController.clear();
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<String> _showCreateTodoDialog() {
      return showDialog<String>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Create New Todo'),
              content: TextField(
                controller: _textEditingController,
              ),
              actions: [
                TextButton(
                    onPressed: () => addTodo(_textEditingController.text),
                    child: Text('Add'))
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Todo', style: TextStyle(fontSize: 30)),
          if (todos.isEmpty)
            Center(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text('Nichts zu erledigen!'),
            )),
          ...todos.map((todo) => ListTile(
                leading: Icon(Icons.check_box_outline_blank_outlined),
                title: Text(todo),
                onTap: () {
                  setState(() {
                    todos.remove(todo);
                    done.add(todo);
                  });
                },
              )),
          Text('Done', style: TextStyle(fontSize: 30)),
          ...done.map((todo) => ListTile(
                leading: Icon(Icons.check_box_rounded),
                title: Text(todo,
                    style: TextStyle(decoration: TextDecoration.lineThrough)),
                onTap: () {
                  setState(() {
                    done.remove(todo);
                    todos.add(todo);
                  });
                },
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateTodoDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
