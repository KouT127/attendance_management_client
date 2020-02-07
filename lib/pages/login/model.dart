import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class Model extends ChangeNotifier {
  Model(navigator, auth)
      : this._navigator = navigator,
        this._auth = auth;

  AppNavigator _navigator;
  Auth _auth;

  factory Model.initialize(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    final auth = Provider.of<Auth>(context);
    return Model(navigator, auth);
  }

  User get user {
    return _auth.user;
  }

  void login() {
    _navigator.pushNamed(LoginPage.loginPath);
  }
}
