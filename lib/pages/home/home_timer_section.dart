import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomeTimerSection extends StatelessWidget {
  const HomeTimerSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
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
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              model.formattedDate,
              style: Theme.of(context).textTheme.subtitle,
            ),
            Text(
              model.formattedTime,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
