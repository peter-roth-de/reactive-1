/**
 * main.1.dart
 * Standard w/o any reactive / redux implementation
 */
import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scoped Model Example [1]'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            Text('$_counter', style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      floatingActionButton: Incrementer(_increment),
    );
  }
}

class Incrementer extends StatefulWidget {
  final Function increment;

  Incrementer(this.increment);

  @override
  _IncrementerState createState() => _IncrementerState();
}

class _IncrementerState extends State<Incrementer> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: widget.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
    );
  }
}