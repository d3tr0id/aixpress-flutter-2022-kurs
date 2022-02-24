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
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
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
    Future<String> _showDialog() {
      return showDialog<String>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Create New Todo'),
              content: TextField(
                decoration: InputDecoration(
                  helperText: 'Create UI Design for App....',
                ),
                controller: _textEditingController,
              ),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    style: TextButton.styleFrom(
                      primary: Colors.pink,
                    ),
                    child: Text(
                      'Cancel',
                    )),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (_textEditingController.text.isNotEmpty)
                        todos.add(_textEditingController.text.trim());
                      Navigator.of(context).pop();
                      _textEditingController.clear();
                    });
                  },
                  child: Text('Add'),
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Todos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            if (todos.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No Todos yet.', style: TextStyle(fontSize: 18)),
              ),
            ReorderableListView(
                shrinkWrap: true,
                children: [
                  ...todos.map((e) => ListTile(
                        key: Key(e),
                        leading: Icon(Icons.check_box_outline_blank_outlined),
                        title: Text(e),
                        onTap: () {
                          setState(() {
                            todos.remove(e);
                            done.add(e);
                          });
                        },
                      ))
                ],
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    String t = todos.removeAt(oldIndex);
                    todos.insert(newIndex, t);
                  });
                }),
            Divider(),
            Text('Done',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            if (done.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Nothing done yet.', style: TextStyle(fontSize: 18)),
              ),
            ...done.map((e) => ListTile(
                  key: Key(e.hashCode.toString()),
                  leading: Icon(Icons.check_box_rounded),
                  title: Text(
                    e,
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  onTap: () {
                    setState(() {
                      todos.add(e);
                      done.remove(e);
                    });
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
