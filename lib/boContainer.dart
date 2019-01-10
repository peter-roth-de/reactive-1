import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
// BO

class BusinessObject {
  final int amount;
  final String addTime;
  BusinessObject(this.amount, this.addTime);
}

class BoContainer {
  final List<BusinessObject> _items = <BusinessObject>[];

  // Creates an empty counter.
  BoContainer();

  int get itemCount =>_items.length;
  
  void add(BusinessObject bo) {
    _items.add(bo);
  }

  // static factory
  static BusinessObject createItem(int amount) {
    DateFormat df = new DateFormat("de_DE");

    String addTime = df.add_yMd().add_jm().format(new DateTime.now());
    //String addTime = "abc";
    //DateTime.now();
    return new BusinessObject(amount, addTime);
  }
}