import 'package:attendance_management/pages/splash/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SplashRouter, void>(
      create: (_) => SplashRouter(),
      child: const _SplashPage(),
    );
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage();

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
