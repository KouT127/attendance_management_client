import 'dart:async';

import 'package:attendance_management/pages/home/home_state.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeNotifier() : super(const HomeState()) {
    logger.info('initialize home');
    homeState = HomeState(datetime: DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
  }

  final dateFormatter = DateFormat("y/MM/dd");
  final timeFormatter = DateFormat("HH:mm:ss");

  Timer _timer;
  HomeState homeState;

  AuthService get _auth => read();

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
  }

  Future<void> signOut() async {
    _auth.signOut();
  }
}
