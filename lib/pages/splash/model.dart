import 'dart:async';

import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:tuple/tuple.dart';

const SplashLeaveTime = 200;

class SplashRouter extends StateNotifier<int> with LocatorMixin {
  SplashRouter() : super(0);

  StreamSubscription _subscription;

  AppNavigator get _navigator => read();

  AppStore get _appStore => read();

  UserState get _userStore => read();

  @override
  void initState() {
    _subscription = CombineLatestStream.combine2(
      _appStore.appState,
      _userStore.user,
      (app, user) => Tuple2<AppState, User>(app, user),
    ).listen((state) {
      final app = state.item1;
      final user = state.item2;
      _navigateByUser(user, app);
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
    super.dispose();
  }

  Future<void> _navigateByUser(User user, AppState appState) async {
    if (appState == null || !appState.initialLoaded) {
      return;
    }

    if (appState.initialLoaded && user.uid != null) {
      _navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }

    if (appState.initialLoaded && user.uid == null) {
      _navigator.pushReplacementNamed(LoginPage.routeName);
    }
  }
}
