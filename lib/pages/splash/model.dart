import 'package:attendance_management/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_notifier/state_notifier.dart';

class SplashRouter extends StateNotifier<void> with LocatorMixin {
  SplashRouter() : super(null);

  AppState appState;

  User user;

  @override
  void initState() {
    super.initState();
  }

  @override
  void update(T Function<T>() watch) {
    super.update(watch);
  }
}
