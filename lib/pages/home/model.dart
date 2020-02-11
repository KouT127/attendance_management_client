import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

class Model extends ChangeNotifier {
  Model({
    @required this.navigator,
    @required this.auth,
    @required this.preferences,
  }) {
    initialize();
  }

  final AppNavigator navigator;
  final AppPreferences preferences;

  final UserState auth;

  factory Model.create(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    final auth = Provider.of<UserState>(context);
    final preferences = Provider.of<AppPreferences>(context);
    return Model(
      navigator: navigator,
      auth: auth,
      preferences: preferences,
    );
  }

  void initialize() {
    SimpleLogger().info('initialize home');
  }

  @override
  void dispose() {
    super.dispose();
  }

  void signOut() {
    auth.signOut();
    preferences.setHadStarted(false);
  }
}
