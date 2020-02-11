import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:simple_logger/simple_logger.dart';

const SplashLeaveTime = 200;

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
    if (appState == null || userState == null || userState.user == null) {
      return this;
    }
    final user = userState.user;
    SimpleLogger().info('update splash ' + user.toString());
    this._navigateByUser(appState, userState);
    return this;
  }

  Future<void> _navigateByUser(AppState appState, UserState userState) async {
    if (!appState.application.initialLoaded) {
      return;
    }

    final user = userState.user;
    if (appState.application.initialLoaded && user.uid != null) {
      navigator.pushReplacementNamed(HomePage.homePath);
      return;
    }

    if (appState.application.initialLoaded && user.uid == null) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }
  }
}
