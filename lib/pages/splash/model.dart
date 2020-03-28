import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/app_state.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:state_notifier/state_notifier.dart';

const SplashLeaveTime = 200;

class SplashRouter extends StateNotifier<void> with LocatorMixin {
  SplashRouter() : super(null);

  StreamSubscription _subscription;

  AppNavigator get _navigator => read();

  Store<AppState> get _store => read();

  @override
  void initState() {
    _subscription = _store.onChange.listen(_handleNavigate);
    super.initState();
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
    super.dispose();
  }

  Future<void> _handleNavigate(AppState appState) async {
    if (appState.initialLoaded && appState.userState.uid != null) {
      _navigator.pushReplacementNamed(HomePage.routeName);
      return;
    }

    if (appState.initialLoaded && appState.userState.uid == null) {
      _navigator.pushReplacementNamed(LoginPage.routeName);
    }
  }
}
