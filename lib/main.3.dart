/**
 * main.3.dart
 * Using BusinessLogicComponent + BusinessObject/BOContainer
 *
 * Inspired by: https://www.youtube.com/watch?v=RS36gBEp8OI&feature=youtu.be
 */

import 'package:flutter/material.dart';

import 'boContainerProvider.3.dart';
import 'boContainerBloc.3.dart';
import 'boContainer.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BOContainerProvider(
      boContainerBloc: BOContainerBloc(),
      child: MaterialApp(
        title: 'Bloc Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Bloc Example [3]'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final boContainerBloc = BOContainerProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            StreamBuilder<int>(
              stream: boContainerBloc.itemCount,
              initialData: 0,
              builder: (context, snapshot) {
                int count = snapshot.data;
                return Text('$count', style: Theme.of(context).textTheme.display1,);
              },
            )
          ],
        ),
      ),
      floatingActionButton: Incrementer(),
    );
  }

}

class Incrementer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boContainerBloc = BOContainerProvider.of(context);
    return FloatingActionButton(
      onPressed: () {
        boContainerBloc.addition.add(BoContainer.createItem(2));
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
