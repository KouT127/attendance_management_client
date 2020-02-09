import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppNavigator>(
          create: (_) => AppNavigator.initialize(navigatorKey),
        ),
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth.initialize(FirebaseAuth.instance),
        ),
        ProxyProvider<Auth, HttpClient>(
          create: (_) => HttpClient.initialize(),
          update: (_, auth, client) => client.update(auth.user),
        )
      ],
      child: App(
        navigatorKey: navigatorKey,
      ),
    );
  }
}

class App extends StatelessWidget {
  App({
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginProvider(),
      navigatorKey: navigatorKey,
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
