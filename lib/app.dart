import 'package:attendance_management/pages/splash/splash_page.dart';
import 'package:attendance_management/services/app_router.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<AppRouter>();
    final navigator = Provider.of<AppNavigator>(context);
    return MaterialApp(
      theme: theme,
      home: SplashPage(),
      navigatorKey: NavigatorHolder.rootKey,
      onGenerateRoute: navigator.onGenerate,
    );
  }
}
