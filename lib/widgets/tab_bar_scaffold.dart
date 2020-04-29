import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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

const PageViewInitialIndex = 1000;

enum PageSwipePositionType {
  none,
  left,
  right,
}

class PageSwipeParameter {
  PageSwipeParameter({
    this.index,
    this.pageSwipePositionType,
  });

  final PageSwipePositionType pageSwipePositionType;
  final int index;

  @override
  String toString() {
    return "PageSwipeParameter(index: $index, positionType: $pageSwipePositionType)";
  }
}

class PageViewNotifier extends ChangeNotifier {
  PageViewNotifier({
    this.initialIndex,
    this.items,
    this.onPageSwipe,
  }) {
    _selectedIndex = initialIndex;
    title = formatter.format(items[_selectedIndex]);
    controller = PageController(
      initialPage: _selectedIndex,
    );
  }

  final ValueChanged<PageSwipeParameter> onPageSwipe;
  final int initialIndex;

  PageController controller;
  String title = '';
  Map<int, DateTime> items = {};
  int _selectedIndex;

  void onSwipe(int nextIndex) {
    final positionType = _detectPositionType(nextIndex);
    _selectedIndex = nextIndex;
    onPageSwipe(PageSwipeParameter(
      index: nextIndex,
      pageSwipePositionType: positionType,
    ));
    title = formatter.format(items[nextIndex]);
    notifyListeners();
  }

  PageSwipePositionType _detectPositionType(int nextIndex) {
    PageSwipePositionType swipePositionType;
    if (_selectedIndex > nextIndex) {
      swipePositionType = PageSwipePositionType.left;
    }
    if (nextIndex > _selectedIndex) {
      swipePositionType = PageSwipePositionType.right;
    }
    return swipePositionType;
  }
}
