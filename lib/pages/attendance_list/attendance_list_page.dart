import 'package:attendance_management/widgets/TabBarScaffold.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AttendanceListPage extends StatelessWidget {
  static String path = '/attendances';

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<TabBarNotifier>(context);

    return TabBarScaffold(
      controller: notifier.controller,
      itemCount: notifier.tabs.length,
      initialPosition: notifier.position,
      title: notifier.title,
      tabViewBuilder: (index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: SkyBlue,
          ),
          child: SafeArea(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return FractionallySizedBox(
                  widthFactor: .95,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: buildLeftItem(context),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text('IN'),
                                  Text(
                                    "10:00",
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text('OUT'),
                                  Text(
                                    "19:00",
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildLeftItem(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '28日',
            style:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
          ),
          const Divider(
            height: 10,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Text(
            '火',
            style:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
