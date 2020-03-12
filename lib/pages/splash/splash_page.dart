import 'package:attendance_management/pages/splash/model.dart';
import 'package:attendance_management/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Model>.value(
      value: Model.create(
        locator: context.watch,
        userState: Provider.of<UserState>(context),
        appState: Provider.of<AppState>(context),
      ),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.select((Model state) => state.toString())),
      ),
    );
  }
}
