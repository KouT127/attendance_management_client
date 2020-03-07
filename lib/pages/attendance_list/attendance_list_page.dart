import 'package:attendance_management/widgets/TabBarScaffold.dart';
import 'package:attendance_management/widgets/outlined_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AttendanceListPage extends StatelessWidget {
  static String routeName = '/attendances';

  @override
  Widget build(BuildContext context) {
    final tabBarNotifier = context.watch<DateTimeTabBarNotifier>();
    return TabBarScaffold(
      controller: tabBarNotifier.controller,
      itemCount: tabBarNotifier.datetimeList.length,
      initialPosition: tabBarNotifier.datetimeList.length,
      title: tabBarNotifier.title,
      tabViewBuilder: (index) {
        return FractionallySizedBox(
          widthFactor: .97,
          child: DecoratedBox(
            key: Key(index.toString()),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return OutlinedBox(
                    color: Colors.grey,
                    date: DateTime.now(),
                    clockInTime: DateTime.now(),
                    clockOutTime: DateTime.now(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
