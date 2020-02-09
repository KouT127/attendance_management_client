import 'package:flutter/widgets.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> key;

  AppNavigator(GlobalKey<NavigatorState> key) : this.key = key;

  factory AppNavigator.create(GlobalKey<NavigatorState> key) {
    return AppNavigator(key);
  }

  void push<T>(Route<T> route) {
    key.currentState.push<T>(route);
  }

  void pushNamed(name, {Object arguments}) {
    key.currentState.pushNamed(name, arguments: arguments);
  }

  void pushReplacementNamed(name, {Object arguments}) {
    key.currentState.pushReplacementNamed(name, arguments: arguments);
  }
}
