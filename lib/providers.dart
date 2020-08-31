import 'package:attendance_management/services/app_router.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:attendance_management/states/app_state.dart';
import 'package:attendance_management/states/user_state.dart';
import 'package:attendance_management/stores/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

extension onAuthStateChangeEx on Stream<FirebaseUser> {
  Stream<UserState> get user {
    return this.map((user) {
      return UserState(
        uid: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        emailVerified: user?.emailVerified,
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
        Provider(create: (_) => AppNavigator()),
        Provider(create: (_) => PreferenceService()),
        Provider(create: (_) => HttpClientService(Client())),
        Provider(
          create: (context) => AuthService(
            auth: firebaseAuth,
            httpClient: context.read(),
          ),
        ),
        StateNotifierProvider<AppStateNotifier, AppState>(
          create: (_) => AppStateNotifier(),
        ),
        Provider(
          create: (context) => AppRouter(
            appStateNotifier: context.read(),
            authService: context.read(),
          ),
        ),
      ],
      child: const App(),
    );
  }
}
