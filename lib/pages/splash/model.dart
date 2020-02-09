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
  final Auth auth;
  final Router router;
  final HttpClient client;
  bool isInitial = true;

  factory Model.create({
    Router router,
    AppPreferences preferences,
    Auth auth,
    HttpClient client,
  }) {
    return Model(
      auth: auth,
      preferences: preferences,
      router: router,
      client: client,
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
