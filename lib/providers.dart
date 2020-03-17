import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

extension onAuthStateChangeEx on Stream<FirebaseUser> {
  Stream<User> get user {
    return this.map((user) {
      return User(
        uid: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        photoUrl: user?.photoUrl,
        isEmailVerified: user?.isEmailVerified,
        getIdToken: user?.getIdToken,
      );
    });
  }
}

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppNavigator(navigatorKey: navigatorKey)),
        Provider(create: (_) => PreferenceService()),
        Provider(create: (_) => HttpClientService(Client())),
        Provider(create: (_) => AuthService(auth: firebaseAuth)),
        StreamProvider<FirebaseUser>.value(
          value: firebaseAuth.onAuthStateChanged,
        ),
      ],
      child: StoreProviders(),
    );
  }
}

class StoreProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AppStateNotifier, AppState>(
            create: (_) => AppStateNotifier()),
        StateNotifierProvider<UserStateNotifier, User>(
            create: (_) => UserStateNotifier())
      ],
      child: const App(),
    );
  }
}
