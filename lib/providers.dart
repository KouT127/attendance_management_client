import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/app_state.dart';
import 'package:attendance_management/services/auth_router.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();
  final store = Store<AppState>(initialState: AppState());
  final auth = FirebaseAuth.instance;
  final client = Client();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppNavigator>(
          create: (_) => AppNavigator(navigatorKey: navigatorKey),
        ),
        Provider<PreferenceService>(
          create: (_) => PreferenceService(),
        ),
        Provider<HttpClientService>(
          create: (_) => HttpClientService(client),
        ),
        Provider<AuthService>(
          create: (_) => AuthService(auth: auth),
        ),
      ],
      child: AppStateProvider(
        store: store,
        auth: auth,
      ),
    );
  }
}

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({
    this.store,
    this.auth,
  });

  final Store<AppState> store;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Provider(
        create: (_context) => AuthRouter(
          auth: auth,
          store: store,
          locator: _context.read,
        )..listen(),
        dispose: (_, AuthRouter router) => router..dispose(),
        child: const App(),
      ),
    );
  }
}
