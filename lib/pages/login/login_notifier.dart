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

  AuthService get _auth => locator();

  String email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;

  void initialize() {
    logger.info('initialize login');
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    logger.info('dispose login');
    emailNode.dispose();
    passwordNode.dispose();
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
}
