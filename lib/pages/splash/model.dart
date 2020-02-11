import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:simple_logger/simple_logger.dart';

class Model {
  Model({
    this.preferences,
    this.navigator,
  });

  factory Model.create({
    AppNavigator navigator,
    AppPreferences preferences,
  }) {
    return Model(
      preferences: preferences,
      navigator: navigator,
    );
  }

  final AppPreferences preferences;
  final AppNavigator navigator;

  AppState appState;
  UserState userState;

  Model update({AppState appState, UserState userState}) {
    if (appState == null || userState == null) {
      return this;
    }
    SimpleLogger().info('update splash');
    this._navigateByUser(appState, userState);
    return this;
  }

  Future<void> _navigateByUser(AppState appState, UserState userState) async {
    if (appState?.application == null || !appState.application.initialLoaded) {
      return;
    }

    final user = userState.user;
    if (user == null || user?.uid == null) {
//      navigator.pushReplacementNamed(LoginPage.loginPath);
      return;
    }

    if (user != null && user.uid != null) {
//      navigator.pushReplacementNamed(HomePage.homePath);
    }
  }
}
