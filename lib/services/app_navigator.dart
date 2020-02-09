import 'package:flutter/widgets.dart';

class AppNavigator {
  const AppNavigator(
    this.navigatorKey,
  );

  final GlobalKey<NavigatorState> navigatorKey;

  factory AppNavigator.create() {
    print('create navigator');
    return AppNavigator(
      GlobalKey<NavigatorState>(),
    );
  }

  void push<T>(Route<T> route) {
    navigatorKey.currentState.push<T>(route);
  }

  void pushNamed(name, {Object arguments}) {
    navigatorKey.currentState.pushNamed(
      name,
      arguments: arguments,
    );
  }

  void pushReplacementNamed(name, {Object arguments}) {
    navigatorKey.currentState.pushReplacementNamed(
      name,
      arguments: arguments,
    );
  }
}
