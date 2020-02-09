import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';

class Model {
  Model({
    this.auth,
    this.preferences,
    this.router,
  }) {
    initialize();
  }

  final AppPreferences preferences;
  final Auth auth;
  final Router router;
  bool isInitial = true;

  factory Model.create({
    Router router,
    AppPreferences preferences,
    Auth auth,
  }) {
    return Model(
      auth: auth,
      preferences: preferences,
      router: router,
    );
  }

  Future<void> initialize() async {
    print('splash initialize');
    final hadStarted = await preferences.getHadStarted();
    if (!hadStarted) {
      await auth.auth.signInAnonymously();
      await preferences.setHadStarted(true);
    }
  }
}
