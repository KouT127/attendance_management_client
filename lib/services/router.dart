import 'package:attendance_management/pages/home/home.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:simple_logger/simple_logger.dart';

import 'services.dart';

class Router {
  Router({
    this.preferences,
    this.navigator,
  });

  final AppPreferences preferences;
  final AppNavigator navigator;

  factory Router.create({
    AppPreferences preferences,
    AppNavigator navigator,
  }) {
    SimpleLogger().info('create router');
    return Router(
      preferences: preferences,
      navigator: navigator,
    );
  }

  Router update({AppState appState, UserState userState}) {
    this._navigateByUser(appState, userState);
    return this;
  }

  Future<void> _navigateByUser(AppState appState, UserState userState) async {
    if (appState?.application == null || !appState.application.initialLoaded) {
      return;
    }

    final user = userState.user;
    if (user == null || user?.uid == null) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }

    if (user != null && user.uid != null) {
      navigator.pushReplacementNamed(HomePage.routeName);
    }
  }
}
