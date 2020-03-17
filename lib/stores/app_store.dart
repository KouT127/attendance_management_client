import 'package:attendance_management/models/models.dart';
import 'package:state_notifier/state_notifier.dart';

class AppStateNotifier extends StateNotifier<AppState> with LocatorMixin {
  AppStateNotifier() : super(const AppState(initialLoaded: false));

  void loaded() {
    state = state.copyWith(initialLoaded: true);
  }
}
