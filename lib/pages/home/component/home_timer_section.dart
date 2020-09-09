import 'dart:async';

import 'package:attendance_management/utlities/utlities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class TimeNotifier extends StateNotifier<DateTime> with LocatorMixin {
  TimeNotifier() : super(DateTime.now());

  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), _onChangeTimer);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onChangeTimer(Timer timer) {
    final now = DateTime.now();
    state = now;
  }
}

class HomeTimer extends StatelessWidget {
  const HomeTimer();

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TimeNotifier, DateTime>(
      create: (BuildContext context) => TimeNotifier(),
      child: const _HomeTimerSection(),
    );
  }
}

class _HomeTimerSection extends StatelessWidget {
  const _HomeTimerSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ASIA/TOKYO",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              context.watch<DateTime>().formattedDate,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              context.watch<DateTime>().formattedTime,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
