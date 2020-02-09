import 'package:attendance_management/pages/splash/model.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SplashPageProvider extends StatelessWidget {
  bool isInitial = true;

//  void onInit(BuildContext context) {
//    final router = Provider.of<Router>(context);
//    final preferences = Provider.of<AppPreferences>(context);
//    final auth = Provider.of<Auth>(context);
//    SchedulerBinding.instance.addPostFrameCallback((_) async {});
//  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Model.create(
        preferences: Provider.of<AppPreferences>(context),
        auth: Provider.of<Auth>(context),
        router: Provider.of<Router>(context),
        client: Provider.of<HttpClient>(context),
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
