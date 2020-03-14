import 'dart:async';

import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/home/home_state.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeNotifier extends ChangeNotifier {
  HomeNotifier(this.locator) {
    logger.info('initialize home');
    homeState = HomeState(datetime: DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
    _userStore.user.listen(_onChangeUser);
  }

  final Locator locator;
  final dateFormatter = DateFormat("y/MM/dd");
  final timeFormatter = DateFormat("HH:mm:ss");

  Timer _timer;
  HomeState homeState;

  AuthService get _auth => locator();

  UserStore get _userStore => locator();

  String get formattedDate => dateFormatter.format(homeState.datetime);

  String get formattedTime => timeFormatter.format(homeState.datetime);

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onChangeTimer(Timer timer) {
    final now = DateTime.now();
    homeState = homeState.copyWith(datetime: now);
    notifyListeners();
  }

  void _onChangeUser(User user) {
    homeState = homeState.copyWith(user: user);
    notifyListeners();
  }

  Future<void> signOut() async {
    if (homeState.user == null) {
      return;
    }
    _auth.signOut();
  }
}
