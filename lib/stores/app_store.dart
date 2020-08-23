import 'package:attendance_management/models/models.dart';
import 'package:behavior_subject_mixin/behavior_subject_mixin.dart';
import 'package:state_notifier/state_notifier.dart';

class AppStateNotifier extends StateNotifier<AppState>
    with BehaviorSubjectMixin {
  AppStateNotifier() : super(const AppState(initialLoaded: false));

  void loaded() {
    state = state.copyWith(initialLoaded: true);
  }
}
