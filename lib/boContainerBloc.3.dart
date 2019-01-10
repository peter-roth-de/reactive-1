import 'dart:async';

import 'package:reactive_1/boContainer.dart';
import 'package:rxdart/subjects.dart';

class BOContainerBloc {
  final _container = BoContainer();

  Sink<BusinessObject> get addition => _additionController.sink;
  final _additionController = StreamController<BusinessObject>();

  Stream<int> get itemCount => _itemCountSubject.stream;
  final _itemCountSubject = BehaviorSubject<int>();

  BOContainerBloc() {
    _additionController.stream.listen(_handle);
  }


  // adds the busobject to the container and
  // fires the event through the stream (subject.add(...))
  void _handle(BusinessObject bo) {
    _container.add(bo);
    _itemCountSubject.add(_container.itemCount);
  }


}