import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_notifier.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginNotifier>(
      create: (_) => LoginNotifier(locator: context.read),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  static final loginPath = '/login';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginNotifier>(context);
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
