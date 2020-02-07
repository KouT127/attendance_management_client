import 'package:attendance_management/services/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class Model extends ChangeNotifier {
  Model(context) : this.context = context;

  BuildContext context;

  factory Model.initialize(BuildContext context) {
    return Model(context);
  }

  void login() {
    final navigator = Provider.of<AppNavigator>(context, listen: false);
    navigator.pushNamed(LoginPage.loginPath);
  }
}
