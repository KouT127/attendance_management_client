import 'package:attendance_management/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Provider.of<Router>(context);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      router.initialize();
    });
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
