import 'package:attendance_management/pages/attendance_input/attendance_input_page.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/pages/tab/tab_page.dart';
import 'package:attendance_management/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  const AppNavigator({
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> onGenerate(RouteSettings settings) {
    if (settings.name == HomePage.routeName) {
      return FadeRoute(
        builder: (_) => TabPage(),
      );
    }

    if (settings.name == LoginPage.routeName) {
      return FadeRoute(
        builder: (_) => LoginPageProvider(),
      );
    }

    if (settings.name == AttendanceInputPage.routeName) {
      return OverlaySlideUpRoute(
        child: BottomInputField(),
      );
    }

    return MaterialPageRoute(
      builder: (_) => const SplashPage(),
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
