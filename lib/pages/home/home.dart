import 'package:attendance_management/services/services.dart';
import 'package:flutter/material.dart';
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
    final model = Provider.of<Model>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashbord'),
        centerTitle: true,
        backgroundColor: const Color(0xff4dc1e9),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.95,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            size: 50,
                          ),
                          Text(
                            model.formattedDate,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            model.formattedTime,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
