import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_logger/simple_logger.dart';

class Model extends ChangeNotifier {
  Model({
    @required this.navigator,
  }) {
    initialize();
  }

  final AppNavigator navigator;
  UserState userState;
  String email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;

  factory Model.create({AppNavigator navigator}) {
    return Model(
      navigator: navigator,
    );
  }

  Model update({UserState userState}) {
    this.userState = userState;
    _navigate(userState);
    return this;
  }

  void initialize() {
    SimpleLogger().info('initialize login');
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    SimpleLogger().info('dispose login');
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  Future<void> _navigate(UserState userState) async {
    if (userState == null || userState?.user == null) {
      return;
    }
    final user = userState.user;
    if (user.uid != null) {
      navigator.pushReplacementNamed(HomePage.homePath);
    }
  }

  void handleChangeEmail(String email) {
    this.email = email;
  }

  void handleChangePassword(String password) {
    this.password = password;
  }

  void login() {
    userState.signIn(
      email: 'test@test.com',
      password: 'abcd1234',
    );
  }
}
