import 'package:flutter/material.dart';

class OutlinedBox extends StatelessWidget {
  const OutlinedBox({
    @required this.labelColor,
    @required this.date,
    @required this.clockInTime,
    @required this.clockOutTime,
  });

  final DateTime date;
  final DateTime clockInTime;
  final DateTime clockOutTime;

  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.white,
          child: InkWell(
            highlightColor: labelColor.withOpacity(.1),
            splashColor: labelColor.withOpacity(.3),
            onTap: () {
              print('tap');
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(.6),
                ),
              ),
              child: Row(
                children: <Widget>[
                  buildLeftItem(context),
                  buildAttendanceItem(context, "IN", "10:00"),
                  buildAttendanceItem(context, "OUT", "19:00")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAttendanceItem(BuildContext context, String title, String time) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: labelColor.withOpacity(.6), fontSize: 18),
          ),
          Text(
            time,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: labelColor.withOpacity(.6), fontSize: 18),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildLeftItem(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '火',
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: labelColor.withOpacity(.8), fontSize: 12),
          ),
          Text(
            '28',
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: labelColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
