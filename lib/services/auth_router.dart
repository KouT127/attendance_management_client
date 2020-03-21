import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/redux/actions/user_actions.dart';
import 'package:attendance_management/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

extension AuthStateChangedExtension on Stream<FirebaseUser> {
  Stream<UserState> get toUserState {
    return this.map(
      (user) => UserState(
        uid: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        photoUrl: user?.photoUrl,
        isEmailVerified: user?.isEmailVerified,
        getIdToken: user?.getIdToken,
      ),
    );
  }
}

class AuthRouter {
  AuthRouter({
    this.auth,
    this.store,
    this.locator,
  });

  final FirebaseAuth auth;
  final Store<AppState> store;

  Locator locator;
  StreamSubscription _subscription;

  HttpClientService get _client => locator();

  void listen() {
    _subscription = auth.onAuthStateChanged.toUserState.listen((user) {
      store.dispatch(LoadUser(client: _client, userState: user));
    });
  }

  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
  }
}
