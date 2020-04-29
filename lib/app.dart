import 'package:attendance_management/pages/splash/splash_page.dart';
import 'package:attendance_management/services/auth_router.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = context.watch<AppNavigator>();
    context.watch<AuthRouter>();
    return MaterialApp(
      theme: theme,
      navigatorKey: navigator.navigatorKey,
      onGenerateRoute: navigator.onGenerate,
      home: const SplashPage(),
    );
  }
}
