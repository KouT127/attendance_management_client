import 'dart:async';

import 'package:attendance_management/pages/home/home_state.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeNotifier() : super(HomeState(datetime: DateTime.now()));

  Timer _timer;

  AuthService get _auth => read();

  @override
  void initState() {
    logger.info('initialize home');
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onChangeTimer(Timer timer) {
    final now = DateTime.now();
    state = state?.copyWith(
      datetime: now,
      totalTime: 180.0,
      workedTime: 100.0,
    );
  }

//  void _onChangeUser(UserState user) {
//    state = state.copyWith(user: user);
//  }

  Future<void> signOut() async {
    if (state.user == null) {
      return;
    }
    _auth.signOut();
  }
}
