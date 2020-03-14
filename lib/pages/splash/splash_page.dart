import 'package:attendance_management/pages/splash/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SplashRouter>(
      create: (_) => SplashRouter(locator: context.read),
      dispose: (_, router) => router.dispose(),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.watch<SplashRouter>();
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
