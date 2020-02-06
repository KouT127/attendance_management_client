import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: null,
                  child: Text('test'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
