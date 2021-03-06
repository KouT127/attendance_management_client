import 'package:attendance_management/pages/home/home_page.dart';
import 'package:attendance_management/pages/profile/profile_page.dart';
import 'package:attendance_management/pages/tab/tab_notifier.dart';
import 'package:attendance_management/states/tab_state.dart';
import 'package:attendance_management/utlities/route.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TabNotifier, TabState>(
      create: (_) => TabNotifier(
        const TabState(),
      ),
      child: const _TabPage(),
    );
  }
}

class _TabPage extends StatelessWidget {
  const _TabPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<TabState>().currentIndex,
        children: <Widget>[
          Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == '/') {
                return FadeRoute<dynamic>(builder: (BuildContext context) {
                  return const HomePage();
                });
              }

              return null;
            },
          ),
          Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == '/') {
                return MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const ProfilePage(),
                );
              }
              return null;
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabState>().currentIndex,
        selectedItemColor: SkyBlue,
        unselectedItemColor: Colors.grey,
        onTap: context.watch<TabNotifier>().onTap,
        items: const [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(
              Icons.account_box,
            ),
          ),
        ],
      ),
    );
  }
}
