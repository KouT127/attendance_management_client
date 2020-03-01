import 'package:attendance_management/widgets/TabBarScaffold.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceDetailPage extends StatefulWidget {
  static String path = '/attendance_detail';

  @override
  _AttendanceDetailPageState createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage>
    with TickerProviderStateMixin {
  int position = 2;
  var tabs = ['2019/12', '2020/01', '2020/02', '2020/03', '2020/04'];
  var tabViews = ['Tab1', 'Tab2', 'Tab3'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarScaffold(
      tabBuilder: (index) {
        return Tab(text: "$index");
      },
      tabViewBuilder: (index) {
        return Container(
          child: Center(
            child: Text('$index'),
          ),
        );
      },
      itemCount: tabs.length,
      floatingActionButton: FloatingActionButton(
        backgroundColor: SkyBlue,
        onPressed: () {
          setState(() {
            tabs.add('Page ${tabs.length}');
            tabViews.add('Page ${tabViews.length}');
          });
        },
      ),
    );
  }
}
