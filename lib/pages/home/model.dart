import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_logger/simple_logger.dart';

class Model extends ChangeNotifier {
  Model({
    @required this.navigator,
  }) {
    SimpleLogger().info('initialize home');
  }

  final AppNavigator navigator;
  UserState userState;

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

  void _navigate(UserState userState) {
    if (userState?.user?.uid == null) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }
  }

  Future<void> signOut() async {
    if (userState?.user == null) {
      return;
    }
    userState.signOut();
  }
}
