import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomeTimerSection extends StatelessWidget {
  const HomeTimerSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = context.watch<TimerNotifier>().formattedDate;
    final time = context.watch<TimerNotifier>().formattedTime;
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
              date,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
