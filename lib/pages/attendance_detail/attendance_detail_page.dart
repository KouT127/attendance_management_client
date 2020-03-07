import 'package:attendance_management/widgets/TabBarScaffold.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AttendanceDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<DateTimeTabBarNotifier>(context);
    return TabBarScaffold(
      title: notifier.title,
      controller: notifier.controller,
      itemCount: notifier.datetimeList.length,
      initialPosition: notifier.position,
      tabBuilder: (index) {
        return Tab(
          text: notifier.datetimeList[index].toIso8601String(),
        );
      },
      tabViewBuilder: (index) {
        return Container(
          child: Center(
            child: Text(
              '$index',
              style: TextStyle().copyWith(color: Colors.black),
            ),
          ),
        );
      },
      floatingActionButton: FloatingActionButton(
        backgroundColor: SkyBlue,
        onPressed: () {},
      ),
    );
  }
}
