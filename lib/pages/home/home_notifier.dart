import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/home/home_state.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeNotifier() : super(HomeState(datetime: DateTime.now()));

  StreamSubscription _subscription;

  Timer _timer;

  AuthService get _auth => read();

  Store<AppState> get _store => read();

  @override
  void initState() {
    _onInitialize(_store.state);
    _subscription = _store.onChange.listen(_onChangeUser);
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
    super.dispose();
  }

  void _onInitialize(AppState appState) {
    state = state.copyWith(
      user: appState.userState,
    );
  }

  void _onChangeTimer(Timer timer) {
    final now = DateTime.now();
    state = state?.copyWith(
      datetime: now,
      totalTime: 180.0,
      workedTime: 100.0,
    );
  }

  void _onChangeUser(AppState appState) {
    state = state.copyWith(
      user: appState.userState,
    );
  }

  Future<void> signOut() async {
    if (state.user == null) {
      return;
    }
    _auth.signOut();
  }
}
