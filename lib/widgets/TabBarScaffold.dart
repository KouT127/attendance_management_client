import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef TabBuilder = Widget Function(int index);
typedef TabViewBuilder = Widget Function(int index);
//
//class TabBarScaffold extends StatefulWidget {
//  const TabBarScaffold({
//    Key key,
//    this.initialPosition = 0,
//    this.floatingActionButton,
//    this.itemCount,
//    this.tabBuilder,
//    this.tabViewBuilder,
//  }) : super(key: key);
//
//  final Widget floatingActionButton;
//  final int itemCount;
//  final int initialPosition;
//  final TabBuilder tabBuilder;
//  final TabViewBuilder tabViewBuilder;
//
//  @override
//  _TabBarScaffoldState createState() => _TabBarScaffoldState();
//}

class TabBarScaffold extends StatelessWidget {
  const TabBarScaffold({
    Key key,
    this.initialPosition = 0,
    this.floatingActionButton,
    this.itemCount,
    this.tabBuilder,
    this.tabViewBuilder,
    this.controller,
  }) : super(key: key);

  final Widget floatingActionButton;
  final int itemCount;
  final int initialPosition;
  final TabBuilder tabBuilder;
  final TabViewBuilder tabViewBuilder;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SkyBlue,
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: List.generate(
            itemCount,
            tabBuilder,
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: List.generate(
          itemCount,
          tabViewBuilder,
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
      create: (_) => TabBarNotifier.create(this),
      child: widget.child,
    );
  }
}

class TabBarNotifier extends ChangeNotifier {
  TabBarNotifier({
    this.tickerProvider,
    this.initialPosition,
  }) {
    position = initialPosition;
    createController();
  }

  var tabs = [
    '2019/12',
    '2020/01',
    '2020/02',
    '2020/03',
    '2020/04',
  ];

  TabController controller;
  int position;

  final int initialPosition;
  final TickerProvider tickerProvider;

  factory TabBarNotifier.create(
    TickerProvider tickerProvider, {
    int initialPosition = 0,
  }) {
    return TabBarNotifier(
      tickerProvider: tickerProvider,
      initialPosition: initialPosition,
    );
  }

  void addTab() {
    tabs.add('Page ${tabs.length}');
    disposeController();
    createController();
    notifyListeners();
  }

  void createController() {
    controller = TabController(
      initialIndex: position,
      vsync: this.tickerProvider,
      length: tabs.length,
    );
    controller.addListener(onSwipe);
  }

  void disposeController() {
    if (controller != null) {
      controller.removeListener(onSwipe);
      controller.dispose();
    }
  }

  void onSwipe() {
    position = controller.index;
  }
}
