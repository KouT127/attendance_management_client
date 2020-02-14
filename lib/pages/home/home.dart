import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/widgets/shadow_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model.dart';

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
    final query = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTimerSection(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ShadowBox(
                          child: SizedBox(
                            width: query.size.width / 2.3,
                            height: query.size.width / 2.3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "TOTAL",
                                    style: GoogleFonts.roboto(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ShadowBox(
                          child: SizedBox(
                            width: query.size.width / 2.3,
                            height: query.size.width / 2.3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "OVER TIME",
                                    style: GoogleFonts.roboto(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimerSection(BuildContext context) {
    final model = Provider.of<Model>(context);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ASIA/TOKYO",
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              model.formattedDate,
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              model.formattedTime,
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
