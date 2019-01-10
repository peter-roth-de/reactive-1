import 'package:flutter/widgets.dart';

import 'package:reactive_1/boContainerBloc.3.dart';

/// This is an InheritedWidget that wraps around [CounterBloc]. Think about this
/// as Scoped Model for that specific class.
///
/// This merely solves the "passing reference down the tree" problem for us.
/// You can solve this in other ways, like through dependency injection.
///
/// Also note that this does not call [CounterBloc.dispose]. If your app
/// ever doesn't need to access the cart, you should make sure it's
/// disposed of properly.
class BOContainerProvider extends InheritedWidget {
  final BOContainerBloc boContainerBloc;

  BOContainerProvider({
    Key key,
    BOContainerBloc boContainerBloc,
    Widget child,
  })  : boContainerBloc = boContainerBloc ?? BOContainerBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BOContainerBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BOContainerProvider) as BOContainerProvider)
          .boContainerBloc;
}