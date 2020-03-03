import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef TabBuilder = Widget Function(int index);
typedef TabViewBuilder = Widget Function(int index);

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
        title: Text(title),
        backgroundColor: SkyBlue,
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
    title = tabs[position];
    createController();
  }

  var tabs = [
    '2019/12',
    '2020/01',
    '2020/02',
    '2020/03',
    '2020/04',
  ].toList(growable: true);

  TabController controller;
  int position;
  String title = '';

  final int initialPosition;
  final TickerProvider tickerProvider;

  factory TabBarNotifier.create(
    TickerProvider tickerProvider, {
    int initialPosition = 2,
  }) {
    return TabBarNotifier(
      tickerProvider: tickerProvider,
      initialPosition: initialPosition,
    );
  }

  void addTab() {
    tabs.add('Page ${tabs.length}');
  }

  void createController() {
    controller = TabController(
      initialIndex: position,
      vsync: this.tickerProvider,
      length: tabs.length,
    );
    final idx = controller.index;
    final len = controller.length;
    print("idx: $idx len: $len");
    controller.animation.addStatusListener(onScroll);
    controller.addListener(onSwipe);
  }

  void disposeController() {
    if (controller != null) {
      controller.removeListener(onSwipe);
      controller.dispose();
    }
  }

  void onScroll(AnimationStatus status) {
    print(status.toString());
  }

  void onSwipe() {
    final index = controller.index;
    position = index;
    title = tabs[index];

    if (index == 0) {
      tabs.insert(0, 'page $index');
      position++;
    }

    if (index == tabs.length - 1) {
      addTab();
    }

    print(tabs);
    createController();
    notifyListeners();
  }
}
