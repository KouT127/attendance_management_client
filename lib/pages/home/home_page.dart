import 'package:attendance_management/pages/home/component/home_floating_button.dart';
import 'package:attendance_management/widgets/outlined_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const _HomePage();
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: FractionallySizedBox(
              widthFactor: .95,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(bottom: 70),
                itemBuilder: (context, index) {
                  return AttendanceBox(
                    labelColor: Colors.grey,
                    date: DateTime.now(),
                    clockInTime: DateTime.now(),
                    clockOutTime: DateTime.now(),
                  );
                },
              ),
            ),
          ),
          const HomeFloatingButton(),
        ],
      ),
    );
  }
}
