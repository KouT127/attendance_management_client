import 'package:attendance_management/pages/home/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeTimerSection extends StatelessWidget {
  const HomeTimerSection({
    Key key,
  }) : super(key: key);

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
              context.select<HomeNotifier, String>(
                  (HomeNotifier notifier) => notifier.formattedDate),
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              context.select<HomeNotifier, String>(
                  (HomeNotifier notifier) => notifier.formattedTime),
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
