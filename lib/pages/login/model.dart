import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  Model({
    @required this.context,
    @required this.navigator,
    @required this.auth,
  }) {
    initialize();
  }

  final BuildContext context;
  final AppNavigator navigator;
  final Auth auth;
  String email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;

  factory Model.create(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    final auth = Provider.of<Auth>(context);
    return Model(
      context: context,
      navigator: navigator,
      auth: auth,
    );
  }

  void initialize() {
    print('initialize');
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
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
