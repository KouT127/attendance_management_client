import 'package:attendance_management/pages/home/home_page.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/states/user_state.dart';
import 'package:attendance_management/stores/app_store.dart';
import 'package:flutter/cupertino.dart';

import 'app_navigator.dart';
import 'auth_service.dart';

class AppRouter {
  AppRouter({
    @required this.authService,
    @required this.appStateNotifier,
  }) {
    authService.currentUserStream.listen(navigate);
  }

  final AppStateNotifier appStateNotifier;
  final AuthService authService;

  NavigatorState get navigator => NavigatorHolder.rootState;

  Future<void> navigate(
    UserState user,
  ) async {
    if (user?.uid != null) {
      navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }
    navigator.pushReplacementNamed(LoginPage.routeName);
    return;
  }
}
