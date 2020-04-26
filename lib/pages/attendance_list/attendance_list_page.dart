import 'package:attendance_management/widgets/outlined_box.dart';
import 'package:attendance_management/widgets/tab_bar_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AttendanceListNotifier extends ChangeNotifier {
  AttendanceListNotifier() {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1, 0, 0, 0, 0, 0);
    final beforeOneMonth = DateTime(now.year, now.month - 1, 1, 0, 0, 0, 0, 0);
    final afterOneMonth = DateTime(now.year, now.month + 1, 1, 0, 0, 0, 0, 0);

    datetimeList = {
      initialIndex - 1: beforeOneMonth,
      initialIndex: currentMonth,
      initialIndex + 1: afterOneMonth,
    };
  }

  Map<int, DateTime> datetimeList;
  int selectedIndex = 1000;
  final initialIndex = 1000;

  void handlePageSwipe(PageSwipeParameter parameter) {
    selectedIndex = parameter.index;
    if (parameter.pageSwipePositionType == PageSwipePositionType.left) {
      final diff = initialIndex - selectedIndex;
      final now = DateTime.now();
      addNewData(
        index: parameter.index,
        datetime: DateTime(now.year, now.month - diff, 1, 0, 0, 0, 0, 0),
      );
      addNewData(
        index: parameter.index - 1,
        datetime: DateTime(now.year, now.month - diff - 1, 1, 0, 0, 0, 0, 0),
      );
      notifyListeners();
    }
    if (parameter.pageSwipePositionType == PageSwipePositionType.right) {
      final diff = (initialIndex - selectedIndex) * -1;
      final now = DateTime.now();

      addNewData(
        index: parameter.index,
        datetime: DateTime(now.year, now.month + diff, 1, 0, 0, 0, 0, 0),
      );
      addNewData(
        index: parameter.index + 1,
        datetime: DateTime(now.year, now.month + diff + 1, 1, 0, 0, 0, 0, 0),
      );
      notifyListeners();
    }
  }

  void addNewData({int index, DateTime datetime}) {
    if (datetimeList.containsKey(index)) {
      return;
    }
    datetimeList.addAll({index: datetime});
  }
}

class AttendanceListPage extends StatelessWidget {
  static String routeName = '/attendances';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AttendanceListNotifier(),
        ),
      ],
      child: Builder(builder: (context) {
        return ChangeNotifierProvider.value(
          value: PageViewNotifier(
            onPageSwipe:
                context.watch<AttendanceListNotifier>().handlePageSwipe,
            initialIndex: context.watch<AttendanceListNotifier>().selectedIndex,
            items: context.watch<AttendanceListNotifier>().datetimeList,
          ),
          child: _AttendanceListPage(),
        );
      }),
    );
  }
}

class _AttendanceListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<PageViewNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(notifier.title),
      ),
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: notifier.controller,
        onPageChanged: notifier.onSwipe,
        itemBuilder: (context, pageIndex) {
          return SafeArea(
            child: Center(
              child: FractionallySizedBox(
                widthFactor: .95,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final model = Provider.of<AttendanceListNotifier>(context);
                    return OutlinedBox(
                      labelColor: Colors.grey,
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
      ),
    );
  }
}
