import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/pages/splash/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class SplashPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SplashRouter, int>(
      create: (_) => SplashRouter(
        appState: StoreProvider.of<AppState>(context, false).onChange,
      ),
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
        child: SizedBox(
          height: 100,
          width: 100,
          child: ColoredBox(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
