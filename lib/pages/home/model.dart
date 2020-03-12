import 'dart:async';

import 'package:attendance_management/pages/home/home_state.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

class HomeNotifier extends ChangeNotifier {
  HomeNotifier(
    this.locator,
  )   : navigator = locator<AppNavigator>(),
        auth = locator<UserState>() {
    initialize();
  }

  final Locator locator;
  final AppNavigator navigator;
  final UserState auth;
  Timer _timer;

  HomeState homeState = const HomeState(formattedTime: '', formattedDate: '');

  void initialize() {
    SimpleLogger().info('initialize home');
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  HomeNotifier update({UserState userState}) {
    homeState = homeState.copyWith(user: userState?.user);
    _navigate();
    return this;
  }

  void _onChangeTimer(Timer timer) {
    final now = DateTime.now();
    final dateFormatter = DateFormat("y/MM/dd");
    final timeFormatter = DateFormat("HH:mm:ss");
    homeState = homeState.copyWith(
      formattedDate: dateFormatter.format(now),
      formattedTime: timeFormatter.format(now),
    );
    notifyListeners();
  }

  void _navigate() {
    if (this.homeState.user?.uid == null) {
      navigator.pushReplacementNamed(LoginPage.loginPath);
    }
  }

  Future<void> signOut() async {
    if (homeState.user == null) {
      return;
    }
    auth.signOut();
  }
}
