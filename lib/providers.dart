import 'package:attendance_management/services/shared_preference.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppNavigator>(create: (_) => AppNavigator.create()),
        Provider<AppPreferences>(create: (_) => AppPreferences.create()),
        Provider<HttpClientService>(create: (_) => HttpClientService.create()),
        Provider<AuthService>(
            create: (_) => AuthService(auth: FirebaseAuth.instance)),
      ],
      child: DependencyProviders(),
    );
  }
}

class DependencyProviders extends StatelessWidget {
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
