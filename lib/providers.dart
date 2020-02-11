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
        Provider<AppNavigator>(create: (_) => AppNavigator.create()),
        Provider<AppPreferences>(create: (_) => AppPreferences.create()),
        Provider<HttpClient>(create: (_) => HttpClient.create()),
        Provider<AppState>(create: (_) => AppState.create()),
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
        ChangeNotifierProvider<UserState>(
          create: (_) => UserState.create(
            client: Provider.of<HttpClient>(context, listen: false),
            updateAppState:
                Provider.of<AppState>(context, listen: false).update,
          ),
        ),
        ProxyProvider2<AppState, UserState, Router>(
          create: (_) => Router.create(
            preferences: Provider.of<AppPreferences>(context, listen: false),
            navigator: Provider.of<AppNavigator>(context, listen: false),
          ),
          update: (_, appState, userState, router) => router.update(
            appState: appState,
            userState: userState,
          ),
        ),
      ],
      child: const App(),
    );
  }
}
