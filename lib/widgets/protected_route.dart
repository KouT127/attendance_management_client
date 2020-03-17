import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class _Model with LocatorMixin {
  _Model() {
    if (_userStore.state == null) {
      _appNavigator.popRoot();
      _appNavigator.pushReplacementNamed(LoginPage.routeName);
      return;
    }
  }

  AppNavigator get _appNavigator => read();

  UserStateNotifier get _userStore => read();
}

class ProtectedRoute extends StatelessWidget {
  ProtectedRoute({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider<_Model>(
      create: (_) => _Model(),
      child: Builder(
        builder: (context) {
          Provider.of<_Model>(context, listen: false);
          return child;
        },
      ),
    );
  }
}
