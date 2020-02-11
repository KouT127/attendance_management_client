import 'package:flutter/widgets.dart';
import 'package:simple_logger/simple_logger.dart';

class AppNavigator {
  const AppNavigator(
    this.navigatorKey,
  );

  final GlobalKey<NavigatorState> navigatorKey;

  factory AppNavigator.create() {
    SimpleLogger().info('create navigator');
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
