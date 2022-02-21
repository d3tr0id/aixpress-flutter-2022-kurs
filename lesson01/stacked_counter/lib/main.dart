import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(const MyApp());
}

class HomeViewModel extends BaseViewModel {
  int _counter = 0;
  int get counter => _counter;
  void incrementCounter() {
    _counter += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stacked',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Stacked Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
