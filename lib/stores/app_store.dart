import 'dart:async';

import 'package:attendance_management/models/models.dart';
import 'package:rxdart/rxdart.dart';

class AppStore {
  AppStore();

  final BehaviorSubject<AppState> _appState =
      BehaviorSubject.seeded(const AppState(
    initialLoaded: false,
  ));

  Stream<AppState> get appState => _appState.stream;

  void dispose() {
    _appState.close();
  }

  void loaded() {
    final state = _appState.value.copyWith(initialLoaded: true);
    _appState.add(state);
  }
}
