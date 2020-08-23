import 'package:flutter/material.dart';

class AttendanceBox extends StatelessWidget {
  const AttendanceBox({
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
                color: Colors.grey.withOpacity(.3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
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
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            time,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: labelColor,
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildLeftItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          const Radius.circular(
            8.0,
          ),
        ),
        child: IntrinsicHeight(
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8.0),
                  Text(
                    '火',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black.withOpacity(.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '28',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black.withOpacity(.8),
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
