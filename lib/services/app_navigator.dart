import 'package:attendance_management/pages/attendance_input/attendance_input_page.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/pages/tab/tab_page.dart';
import 'package:attendance_management/utlities/route.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class NavigatorHolder {
  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

  static NavigatorState get rootState => rootKey.currentState;
}

class AppNavigator {
  AppNavigator();

  final _fadeRoutes = {
    HomePage.routeName: TabPage(),
    LoginPage.routeName: LoginPage(),
  };

  final _materialRoutes = {
    SplashPage.routeName: SplashPage(),
    AttendanceInputPage.routeName: AttendanceInputPage(),
  };

  Route<dynamic> onGenerate(RouteSettings settings) {
    final fadePage = _fadeRoutes[settings.name];
    if (fadePage != null) {
      return FadeRoute<dynamic>(
        builder: (context) => fadePage,
      );
    }

    final materialPage = _materialRoutes[settings.name];
    if (materialPage != null) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => materialPage,
      );
    }

    return null;
  }
}
