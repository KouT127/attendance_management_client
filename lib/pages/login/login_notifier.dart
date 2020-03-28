import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier({
    this.locator,
  }) {
    initialize();
  }

  final Locator locator;

  AppNavigator get _navigator => locator();

  AuthService get _auth => locator();

  Store<AppState> get _store => locator();

  String email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;
  StreamSubscription _subscription;

  void initialize() {
    _subscription = _store.onChange.listen(_handleUserChanged);
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    logger.info('dispose login');
    emailNode.dispose();
    passwordNode.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  void handleChangeEmail(String email) {
    this.email = email;
  }

  void handleChangePassword(String password) {
    this.password = password;
  }

  void login() {
    _auth.signIn(
      email: 'test@test.com',
      password: 'abcd1234',
    );
  }

  void _handleUserChanged(AppState state) {
    if (state?.userState != null && state?.userState?.uid != null) {
      _navigator.popRoot();
      _navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }
  }
}
