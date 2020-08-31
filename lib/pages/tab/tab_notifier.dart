import 'package:attendance_management/states/tab_state.dart';
import 'package:state_notifier/state_notifier.dart';

class TabNotifier extends StateNotifier<TabState> with LocatorMixin {
  TabNotifier(TabState state) : super(state);

  void onTap(index) {
    state = state.copyWith(currentIndex: index);
  }
}
