import 'package:attendance_management/pages/splash/model.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<AppState, UserState, Model>(
      create: (_) => Model.create(
        preferences: Provider.of<AppPreferences>(context, listen: false),
        navigator: Provider.of<AppNavigator>(context, listen: false),
      ),
      update: (_, appState, userState, model) => model.update(
        appState: appState,
        userState: userState,
      ),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<Model>(context);
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
