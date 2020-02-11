import 'package:flutter/widgets.dart';
import 'package:simple_logger/simple_logger.dart';

// ProxyProvider等で、
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

  Future<void> push<T>(Route<T> route) async {
    await Future.delayed(Duration(microseconds: 1));
    navigatorKey.currentState.push<T>(route);
  }

  Future<void> pushNamed(name, {Object arguments}) async {
    await Future.delayed(Duration(microseconds: 1));
    navigatorKey.currentState.pushNamed(
      name,
      arguments: arguments,
    );
  }

  Future<void> pushReplacementNamed(name, {Object arguments}) async {
    await Future.delayed(Duration(microseconds: 1));
    navigatorKey.currentState.pushReplacementNamed(
      name,
      arguments: arguments,
    );
  }
}
