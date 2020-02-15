import 'package:attendance_management/pages/home/home_display_box.dart';
import 'package:attendance_management/pages/home/home_floating_button.dart';
import 'package:attendance_management/pages/home/home_timer_section.dart';
import 'package:attendance_management/pages/home/model.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<UserState, Model>(
      create: (_) => Model.create(
        navigator: Provider.of<AppNavigator>(context),
      ),
      update: (_, userState, model) => model.update(
        userState: userState,
      ),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static String homePath = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: SkyBlue,
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const HomeTimerSection(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const HomeDisplayBox(
                              title: 'Over Time',
                              time: 7.5,
                              isLeft: true,
                            ),
                            const HomeDisplayBox(
                              title: 'Max Time',
                              time: 170.0,
                              isRight: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            const HomeDisplayBox(
                              title: 'Total Time',
                              time: 170.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            const HomeDisplayBox(
                              title: 'Total Time',
                              time: 170.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const HomeFloatingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
