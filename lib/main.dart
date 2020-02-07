import 'package:attendance_management/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/services.dart';

void main() => runApp(Providers());

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
    GlobalKey<NavigatorState> navigatorKey,
  })  : assert(navigatorKey != null),
        this.navigatorKey = navigatorKey;

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      navigatorKey: navigatorKey,
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
