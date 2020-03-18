import 'dart:async';

import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _Model {
  _Model({
    this.locator,
  }) {
    _subscription = _userStore.user.listen((User user) {
      if (user == null || user.uid == null) {
        _appNavigator.popRoot();
        _appNavigator.pushReplacementNamed(LoginPage.routeName);
        return;
      }
    });
  }

  Locator locator;
  StreamSubscription _subscription;

  AppNavigator get _appNavigator => locator();

  UserState get _userStore => locator();

  void dispose() {
    _subscription?.cancel();
  }
}

class ProtectedRoute extends StatelessWidget {
  ProtectedRoute({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider<_Model>(
      create: (_) => _Model(
        locator: context.read,
      ),
      dispose: (_, model) => model.dispose(),
      child: Builder(
        builder: (context) {
          Provider.of<_Model>(context, listen: false);
          return child;
        },
      ),
    );
  }
}
