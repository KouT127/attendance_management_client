import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Model.create(context),
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
