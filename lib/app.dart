import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'services/services.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<AppNavigator>(context);
    return MaterialApp(
      initialRoute: '/',
      navigatorKey: navigator.navigatorKey,
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginProvider(),
        '/home': (context) => HomePage()
      },
    );
  }
}
