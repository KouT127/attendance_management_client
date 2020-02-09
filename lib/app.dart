import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'services/services.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      navigatorKey: Provider.of<AppNavigator>(context).navigatorKey,
      routes: {
        '/login': (context) => LoginProvider(),
      },
    );
  }
}
