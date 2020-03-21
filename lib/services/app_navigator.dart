import 'package:attendance_management/pages/attendance_list/attendance_list_page.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/pages/user/user_page.dart';
import 'package:attendance_management/utils/route.dart';
import 'package:attendance_management/widgets/tab_bar_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  const AppNavigator({
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> onGenerate(RouteSettings settings) {
    if (settings.name == '/settings') {
      return FadeRoute(
        builder: (_) => SettingsProvider(),
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

    if (settings.name == '/login') {
      return FadeRoute(
        builder: (_) => LoginPageProvider(),
      );
    }

    return MaterialPageRoute(
      builder: (_) => SplashPageProvider(),
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

  void popRoot() {
    navigatorKey.currentState.popUntil((route) => route.isFirst);
  }
}
