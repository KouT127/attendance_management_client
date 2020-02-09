import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/pages/home/home.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/shared_preference.dart';

import 'auth.dart';

class Router {
  Router({
    this.preferences,
    this.navigator,
  });

  final AppPreferences preferences;
  final AppNavigator navigator;
  User user;

  factory Router.create({
    AppPreferences preferences,
    AppNavigator navigator,
  }) {
    print('router create');
    return Router(
      preferences: preferences,
      navigator: navigator,
    );
  }

  Router updateUser(Auth auth) {
    this.user = auth.user;
    onUpdateUser(this.user);
    return this;
  }

  void onUpdateUser(User user) {
    if (user == null) {
      return;
    }
    if (user.isAnonymous) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }
    if (user.uid != null && !user.isAnonymous) {
      navigator.pushReplacementNamed(HomePage.homePath);
    }
  }
}
