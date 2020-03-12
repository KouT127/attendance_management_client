import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:provider/provider.dart';

const SplashLeaveTime = 200;

class Model {
  Model({
    this.locator,
    this.userState,
    this.appState,
  })  : auth = locator<Auth>(),
        navigator = locator<AppNavigator>(),
        preferences = locator<AppPreferences>() {
    _navigateByUser();
  }

  factory Model.create({
    Locator locator,
    AppState appState,
    UserState userState,
  }) {
    return Model(
      locator: locator,
      appState: appState,
      userState: userState,
    );
  }

  final Locator locator;
  final Auth auth;
  final AppPreferences preferences;
  final AppNavigator navigator;

  final AppState appState;
  final UserState userState;

//  Model update({AppState appState, UserState userState}) {
//    if (appState == null || userState == null || userState.user == null) {
//      return this;
//    }
//    final user = userState.user;
//    SimpleLogger().info('update splash ' + user.toString());
//    this._navigateByUser(appState, userState);
//    return this;
//  }

  Future<void> _navigateByUser() async {
    if (!appState.application.initialLoaded) {
      return;
    }

    final user = userState.user;
    if (appState.application.initialLoaded && user.uid != null) {
      navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }

    if (appState.application.initialLoaded && user.uid == null) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }
  }
}
