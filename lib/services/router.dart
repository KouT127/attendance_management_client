import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/app_navigator.dart';

import 'auth.dart';

class Router {
  Router({
    this.navigator,
  });

  final AppNavigator navigator;
  Auth auth;

  factory Router.create({AppNavigator navigator}) {
    print('router create');
    return Router(
      navigator: navigator,
    );
  }

  void initialize() {
    if (this?.auth?.user == null) {
      return navigator.pushReplacementNamed(LoginPage.loginPath);
    }
    return;
  }
}
