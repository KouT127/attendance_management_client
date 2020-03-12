import 'dart:async';

import 'package:attendance_management/pages/attendance_list/attendance_list_page.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/utils/route.dart';
import 'package:attendance_management/widgets/tab_bar_scaffold.dart';
import 'package:flutter/material.dart';
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

  Route<dynamic> onGenerate(RouteSettings settings) {
    if (settings.name == '/login') {
      return FadeRoute(
        builder: (_) => LoginPageProvider(),
      );
    }
    if (settings.name == '/home') {
      return FadeRoute(
        builder: (_) => HomePageProvider(),
      );
    }

    if (settings.name == '/attendances') {
      return MaterialPageRoute(
        builder: (_) => TabBarControllerProvider(
          child: AttendanceListPage(),
        ),
      );
    }

    return MaterialPageRoute(
      builder: (_) => SplashPageProvider(),
    );
  }

  Future<void> push<T>(Route<T> route) async {
    scheduleMicrotask(() => {navigatorKey.currentState.push<T>(route)});
  }

  Future<void> pushNamed(name, {Object arguments}) async {
    scheduleMicrotask(() => {
          navigatorKey.currentState.pushNamed(
            name,
            arguments: arguments,
          )
        });
  }

  Future<void> pushReplacementNamed(name, {Object arguments}) async {
    scheduleMicrotask(() => {
          navigatorKey.currentState.pushReplacementNamed(
            name,
            arguments: arguments,
          )
        });
  }
}
