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
      body: Center(
        child: RaisedButton(
          child: Text('sign out'),
          onPressed: () {
            model.signOut();
          },
        ),
      ),
    );
  }
}
