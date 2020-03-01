import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef TabBuilder = Widget Function(int index);
typedef TabViewBuilder = Widget Function(int index);

class TabBarScaffold extends StatefulWidget {
  const TabBarScaffold({
    Key key,
    this.initialPosition = 0,
    this.floatingActionButton,
    this.itemCount,
    this.tabBuilder,
    this.tabViewBuilder,
  }) : super(key: key);

  final Widget floatingActionButton;
  final int itemCount;
  final int initialPosition;
  final TabBuilder tabBuilder;
  final TabViewBuilder tabViewBuilder;

  @override
  _TabBarScaffoldState createState() => _TabBarScaffoldState();
}

class _TabBarScaffoldState extends State<TabBarScaffold>
    with TickerProviderStateMixin {
  TabController controller;
  int position = 0;
  int count = 0;

  @override
  void initState() {
    count = widget.itemCount;
    position = widget.initialPosition;
    controller = TabController(
      initialIndex: position,
      vsync: this,
      length: count,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = TabController(
      initialIndex: position,
      vsync: this,
      length: widget.itemCount,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SkyBlue,
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          tabs: List.generate(
            widget.itemCount,
            widget.tabBuilder,
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: List.generate(
          widget.itemCount,
          widget.tabViewBuilder,
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
