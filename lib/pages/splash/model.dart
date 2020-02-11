import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';

class Model {
  Model({
    this.auth,
    this.preferences,
    this.router,
    this.client,
  }) {
    initialize();
  }

  final AppPreferences preferences;
  final UserState auth;
  final Router router;
  final HttpClient client;
  bool isInitial = true;

  factory Model.create({
    Router router,
    AppPreferences preferences,
    UserState userState,
    HttpClient client,
  }) {
    return Model(
      auth: userState,
      preferences: preferences,
      router: router,
      client: client,
    );
  }

  Future<void> initialize() async {
    print('splash initialize');
    final hadStarted = await preferences.getHadStarted();
    if (!hadStarted) {
      await preferences.setHadStarted(true);
    }
  }
}
