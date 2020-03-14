import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

class LoginNotifier extends ChangeNotifier {
  LoginNotifier({
    this.locator,
  })  : navigator = locator<AppNavigator>(),
        auth = locator<AuthService>() {
    initialize();
  }

  final AppNavigator navigator;
  final Locator locator;
  final AuthService auth;

//  UserState userState;
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
    auth.signIn(
      email: 'test@test.com',
      password: 'abcd1234',
    );
  }
}
