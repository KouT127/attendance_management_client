import 'package:attendance_management/widgets/TabBarScaffold.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AttendanceDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<TabBarNotifier>(context);
    return TabBarScaffold(
      title: notifier.title,
      tabBuilder: (index) {
        return Tab(
          text: notifier.tabs[index],
        );
      },
      tabViewBuilder: (index) {
        return Container(
          child: Center(
            child: Text('$index'),
          ),
        );
      },
      controller: notifier.controller,
      itemCount: notifier.tabs.length,
      initialPosition: notifier.position,
      floatingActionButton: FloatingActionButton(
        backgroundColor: SkyBlue,
        onPressed: () {
          notifier.addTab();
        },
      ),
    );
  }
}
