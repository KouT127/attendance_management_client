import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeDisplayBox extends StatelessWidget {
  const HomeDisplayBox({
    Key key,
    this.title,
    this.time,
    this.isLeft = false,
    this.isRight = false,
  }) : super(key: key);

  final String title;
  final double time;
  final bool isLeft;

  final bool isRight;

  @override
  Widget build(BuildContext context) {
    var inset = const EdgeInsets.all(0);
    if (isLeft) {
      inset = const EdgeInsets.only(right: 5);
    }
    if (isRight) {
      inset = const EdgeInsets.only(left: 5);
    }
    return Expanded(
      flex: 1,
      child: Padding(
        padding: inset,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.body2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    time.toString() + ' Hours',
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
