import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  Model({
    @required this.context,
    @required this.navigator,
    @required this.userState,
  }) {
    initialize();
  }

  final BuildContext context;
  final AppNavigator navigator;
  final UserState userState;
  String email;
  String password;
  FocusNode emailNode;
  FocusNode passwordNode;

  factory Model.create(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    final userState = Provider.of<UserState>(context);
    return Model(
      context: context,
      navigator: navigator,
      userState: userState,
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
    userState.signIn(
      email: 'test@test.com',
      password: 'abcd1234',
    );
  }
}
