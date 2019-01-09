import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model.dart';

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
        home: MyHomePage(title: 'Scoped Model Example'),
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
            onPressed: model.add(2),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
      ),
    );
  }

}

