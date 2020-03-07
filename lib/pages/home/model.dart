import 'dart:async';

import 'package:attendance_management/pages/pages.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:tuple/tuple.dart';

class TimerNotifier extends ChangeNotifier {
  TimerNotifier({
    @required this.navigator,
  }) {
    initialize();
  }

  final AppNavigator navigator;
  UserState userState;
  Timer _timer;
  String formattedDate;
  String formattedTime;

  void initialize() {
    SimpleLogger().info('initialize home');
    final now = formattedNow();
    formattedDate = now.item1;
    formattedTime = now.item2;
    this._timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  factory TimerNotifier.create({
    AppNavigator navigator,
  }) {
    return TimerNotifier(
      navigator: navigator,
    );
  }

  TimerNotifier update({UserState userState}) {
    this.userState = userState;
    _navigate(userState);
    return this;
  }

  Tuple2<String, String> formattedNow() {
    final now = DateTime.now();
    final dateFormatter = DateFormat("y/MM/dd");
    final timeFormatter = DateFormat("HH:mm:ss");
    return Tuple2(dateFormatter.format(now), timeFormatter.format(now));
  }

  void _onChangeTimer(Timer timer) {
    final now = formattedNow();
    formattedDate = now.item1;
    formattedTime = now.item2;
    notifyListeners();
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
