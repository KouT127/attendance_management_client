import 'package:attendance_management/services/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class Model extends ChangeNotifier {
  Model(navigator) : this._navigator = navigator;

  AppNavigator _navigator;

  factory Model.initialize(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    return Model(navigator);
  }

  void login() {
    _navigator.pushNamed(LoginPage.loginPath);
  }
}
