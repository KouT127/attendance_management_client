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
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth.create(),
        ),
        ProxyProvider<Auth, HttpClient>(
          create: (_) => HttpClient.create(),
          update: (_, auth, client) => client.update(auth.user),
        ),
        Provider<Router>(
          create: (_context) => Router.create(
            navigator: Provider.of<AppNavigator>(_context, listen: false),
          ),
        ),
      ],
      child: const App(),
    );
  }
}
