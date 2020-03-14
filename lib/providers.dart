import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppNavigator>(
            create: (_) => AppNavigator(navigatorKey: navigatorKey)),
        Provider<PreferenceService>(create: (_) => PreferenceService()),
        Provider<HttpClientService>(create: (_) => HttpClientService.create()),
        Provider<AuthService>(
            create: (_) => AuthService(auth: FirebaseAuth.instance)),
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
        Provider<AppStore>(create: (_) => AppStore()),
        Provider<UserStore>(
          create: (_context) => UserStore(locator: _context.read),
        )
      ],
      child: const App(),
    );
  }
}
