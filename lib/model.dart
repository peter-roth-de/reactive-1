import 'package:scoped_model/scoped_model.dart';

// BO
class Counter {
  int counter;
  Counter(ctr) {
    counter = ctr;
  }
}

class CounterModel extends Model {
  final _counter = new Counter(0);

  int get count => _counter.counter;

  add(int amount) {
    _counter.counter += amount;
    notifyListeners();
  }
}


