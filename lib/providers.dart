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
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth.create(),
        ),
        ProxyProvider<Auth, HttpClient>(
          create: (_) => HttpClient.create(),
          update: (_, auth, client) => client.update(auth.user),
        ),
        ProxyProvider<Auth, Router>(
          create: (_context) => Router.create(
            preferences: Provider.of<AppPreferences>(_context, listen: false),
            navigator: Provider.of<AppNavigator>(_context, listen: false),
          ),
          update: (_, auth, router) => router.updateUser(auth),
        ),
      ],
      child: const App(),
    );
  }
}
