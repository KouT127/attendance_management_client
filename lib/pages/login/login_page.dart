import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<UserState, Model>(
      create: (_) => Model.create(
        navigator: Provider.of<AppNavigator>(context, listen: false),
      ),
      update: (_, userState, model) => model.update(userState: userState),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  static final loginPath = '/login';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Scaffold(
      key: key,
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
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onChanged: model.handleChangeEmail,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(model.passwordNode),
                      ),
                      TextFormField(
                        focusNode: model.passwordNode,
                        onChanged: model.handleChangePassword,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    model.login();
                  },
                  child: Text('LOGIN'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
