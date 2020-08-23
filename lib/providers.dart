import 'package:attendance_management/models/app_state.dart';
import 'package:attendance_management/models/user_state.dart';
import 'package:attendance_management/pages/home/home_page.dart';
import 'package:attendance_management/pages/login/login_page.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
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
        Provider(create: (_) => AppNavigator(navigatorKey: navigatorKey)),
        Provider(create: (_) => PreferenceService()),
        Provider(create: (_) => HttpClientService(Client())),
        Provider(
          create: (context) => AuthService(
            auth: firebaseAuth,
            httpClientService: context.read(),
          ),
        ),
        StateNotifierProvider<AppStateNotifier, AppState>(
          create: (_) => AppStateNotifier(),
        ),
        Provider(
          create: (context) => Router(
            appStateNotifier: context.read(),
            authService: context.read(),
            navigatorKey: navigatorKey,
          ),
        ),
      ],
      child: const App(),
    );
  }
}

class Router {
  Router({
    @required this.authService,
    @required this.appStateNotifier,
    @required this.navigatorKey,
  }) {
    authService.currentUserStream.listen(navigate);
  }

  final AppStateNotifier appStateNotifier;
  final AuthService authService;
  final GlobalKey<NavigatorState> navigatorKey;

  Future<void> navigate(
    UserState user,
  ) async {
    if (user?.uid != null) {
      navigatorKey.currentState.pushReplacementNamed(HomePage.routeName);
      return;
    }
    navigatorKey.currentState.pushReplacementNamed(LoginPage.routeName);
    return;
  }
}
