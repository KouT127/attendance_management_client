import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

typedef TabBuilder = Widget Function(int index);
typedef TabViewBuilder = Widget Function(int index);
typedef onEmpty = Widget Function();

final formatter = DateFormat('yyyy / MM');

class TabBarScaffold extends StatelessWidget {
  const TabBarScaffold({
    Key key,
    this.initialPosition = 0,
    this.floatingActionButton,
    this.itemCount,
    this.tabBuilder,
    this.tabViewBuilder,
    this.controller,
    this.title,
  }) : super(key: key);

  final Widget floatingActionButton;
  final int itemCount;
  final String title;
  final int initialPosition;
  final TabBuilder tabBuilder;
  final TabViewBuilder tabViewBuilder;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black87),
        title: Text(
          title,
          style:
              Theme.of(context).textTheme.body2.copyWith(color: Colors.black87),
        ),
      ),
      body: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: TabBarView(
          controller: controller,
          children: List.generate(
            itemCount,
            tabViewBuilder,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class TabBarControllerProvider extends StatefulWidget {
  const TabBarControllerProvider({
    this.child,
  });

  final Widget child;

  @override
  _TabBarControllerProviderState createState() =>
      _TabBarControllerProviderState();
}

class _TabBarControllerProviderState extends State<TabBarControllerProvider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DateTimeTabBarNotifier.create(this),
      child: widget.child,
    );
  }
}

class DateTimeTabBarNotifier extends ChangeNotifier {
  DateTimeTabBarNotifier({
    this.tickerProvider,
    this.initialPosition,
    this.datetimeList,
  }) {
    position = initialPosition;
    title = formatter.format(datetimeList[position]);
    createController();
  }

  TabController controller;
  int position;
  String title = '';
  DateTime now;
  List<DateTime> datetimeList = [];

  final int initialPosition;
  final TickerProvider tickerProvider;

  factory DateTimeTabBarNotifier.create(
    TickerProvider tickerProvider, {
    int initialPosition = 4,
  }) {
    final now = DateTime.now();
    final _datetimeList = [
      DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0),
      DateTime(now.year, now.month + 1, now.day, 0, 0, 0, 0, 0),
      DateTime(now.year, now.month + 2, now.day, 0, 0, 0, 0, 0),
      DateTime(now.year, now.month + 3, now.day, 0, 0, 0, 0, 0),
      DateTime(now.year, now.month + 4, now.day, 0, 0, 0, 0, 0),
      DateTime(now.year, now.month + 5, now.day, 0, 0, 0, 0, 0),
    ];

    return DateTimeTabBarNotifier(
      tickerProvider: tickerProvider,
      initialPosition: initialPosition,
      datetimeList: _datetimeList,
    );
  }

  void createController() {
    controller = TabController(
      initialIndex: position,
      vsync: this.tickerProvider,
      length: datetimeList.length,
    );
    final idx = controller.index;
    final len = controller.length;
    print("idx: $idx len: $len");
    controller.addListener(onSwipe);
  }

  void disposeController() {
    if (controller != null) {
      controller.removeListener(onSwipe);
      controller.dispose();
    }
  }

  void onSwipe() {
    final index = controller.index;
    position = index;
    title = formatter.format(datetimeList[index]);

    if (index == 0) {
//      datetimeList.insert(0, DateTime.now());
//      position++;
    }

    controller.removeListener(onSwipe);
    createController();
    notifyListeners();
  }
}
