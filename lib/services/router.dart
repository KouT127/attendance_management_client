import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/pages/home/home.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/app_navigator.dart';

import 'auth.dart';

class Router {
  Router({
    this.navigator,
  });

  final AppNavigator navigator;
  User user;

  factory Router.create({AppNavigator navigator}) {
    print('router create');
    return Router(
      navigator: navigator,
    );
  }

  Router updateUser(Auth auth) {
    this.user = auth.user;
    return this;
  }

  void initialize() {
    if (this.user == null) {
      return;
    }
    if (this.user.isAnonymous) {
      return navigator.pushReplacementNamed(LoginPage.loginPath);
    }
    if (this.user.uid != null) {
      return navigator.pushReplacementNamed(HomePage.homePath);
    }
  }
}
