import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_notifier.dart';

class LoginPage extends StatelessWidget {
  static final routeName = '/login';

  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginNotifier>(
      create: (_) => LoginNotifier(locator: context.read),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({Key key}) : super(key: key);

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
                  children: const [
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
                        onChanged: model.changeEmail,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(model.passwordNode),
                      ),
                      TextFormField(
                        focusNode: model.passwordNode,
                        onChanged: model.changePassword,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    model.login();
                  },
                  child: const Text('LOGIN'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
