import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class LoginPage extends StatelessWidget {
  static final loginPath = '/login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
      create: (_) => Model(context),
      child: Builder(
        builder: (context) {
          final model = Provider.of<Model>(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                            textScaleFactor: 1,
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                      TextField(),
                      TextField(),
                      RaisedButton(
                        onPressed: () {
                          model.login();
                        },
                        child: Text('test'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
