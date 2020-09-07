import 'dart:async';

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

  String _email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;
  StreamSubscription _subscription;

  void initialize() {
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

  void changeEmail(String newEmail) {
    _email = newEmail;
  }

  void changePassword(String newPassword) {
    password = newPassword;
  }

  void login() {
    _auth.signIn(
      email: _email,
      password: password,
    );
  }
}
