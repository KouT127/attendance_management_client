import 'package:attendance_management/services/shared_preference.dart';
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
        Provider<AppNavigator>(
          create: (_) => AppNavigator.create(),
        ),
        Provider<AppPreferences>(
          create: (_) => AppPreferences.create(),
        ),
        Provider<HttpClient>(
          create: (_) => HttpClient.create(),
        ),
        ChangeNotifierProvider<UserState>(
          create: (_) => UserState.create(),
        ),
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
        ChangeNotifierProvider<Auth>(
          create: (_context) => Auth.create(
            onUpdateUser:
                Provider.of<UserState>(_context, listen: false).onUpdateUser,
          ),
        ),
        ProxyProvider<UserState, Router>(
          create: (_context) => Router.create(
            preferences: Provider.of<AppPreferences>(_context, listen: false),
            navigator: Provider.of<AppNavigator>(_context, listen: false),
          ),
          update: (_, userState, router) => router.updateUser(userState),
        ),
      ],
      child: const App(),
    );
  }
}
