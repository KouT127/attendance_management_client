import 'package:attendance_management/providers.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<Router>();
    final navigator = Provider.of<AppNavigator>(context);
    return MaterialApp(
      theme: theme,
      onGenerateRoute: navigator.onGenerate,
      initialRoute: '/',
      navigatorKey: navigator.navigatorKey,
    );
  }
}
