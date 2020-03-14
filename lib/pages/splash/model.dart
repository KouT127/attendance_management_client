import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

const SplashLeaveTime = 200;

class SplashRouter {
  SplashRouter({
    this.locator,
  })  : _auth = locator<AuthService>(),
        _navigator = locator<AppNavigator>(),
        _preferences = locator<PreferenceService>(),
        _appStore = locator<AppStore>(),
        _userStore = locator<UserStore>() {
    CombineLatestStream.combine2(
      _appStore.appState,
      _userStore.user,
      (app, user) => Tuple2<AppState, User>(app, user),
    ).listen((state) {
      final app = state.item1;
      final user = state.item2;
      _navigateByUser(user, app);
    });
  }

  final Locator locator;
  final AuthService _auth;
  final PreferenceService _preferences;
  final AppNavigator _navigator;
  final AppStore _appStore;
  final UserStore _userStore;

  Future<void> _navigateByUser(User user, AppState appState) async {
    if (appState == null || !appState.initialLoaded) {
      return;
    }

    if (appState.initialLoaded && user.uid != null) {
      _navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }

    if (appState.initialLoaded && user.uid == null) {
      _navigator.pushReplacementNamed(LoginPage.loginPath);
    }
  }
}
