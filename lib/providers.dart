import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppNavigator>(
          create: (_) => AppNavigator.create(),
        ),
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth.create(),
        ),
        ProxyProvider<Auth, HttpClient>(
          create: (_) => HttpClient.create(),
          update: (_, auth, client) => client.update(auth.user),
        ),
      ],
      child: const App(),
    );
  }
}
