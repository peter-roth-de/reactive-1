/**
 * main.2.dart
 * Using ScopedModels + model.2.dart
 *
 * Inspired by: https://www.youtube.com/watch?v=RS36gBEp8OI&feature=youtu.be
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model.2.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: MaterialApp(
        title: 'Scoped Model Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Scoped Model Example [2]'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times: abc',),
            ScopedModelDescendant<CounterModel>(
              builder: (context, _, model) => Text(
                model.count.toString(),
                style: Theme.of(context).textTheme.display1,)),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            onPressed: () {
              model.add(2);
              print("floatingActionButton.onPressed()");
              },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
      ),
    );
  }

}

