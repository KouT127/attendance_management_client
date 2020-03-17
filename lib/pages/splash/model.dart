import 'dart:async';

import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_notifier/state_notifier.dart';

const SplashLeaveTime = 200;

class SplashRouter extends StateNotifier<int> with LocatorMixin {
  SplashRouter() : super(0);

  AppNavigator get _navigator => read();

  AppState appState;

  FirebaseUser user;

  @override
  void initState() {
    _navigateByUser(user, appState);
    super.initState();
  }

  @override
  void update(T Function<T>() watch) {
    super.update(watch);
  }

  Future<void> _navigateByUser(FirebaseUser user, AppState appState) async {
    if (appState == null || !appState.initialLoaded) {
      _navigator.pushReplacementNamed(LoginPage.routeName);
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
