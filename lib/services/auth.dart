import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

typedef GetToken = Future<IdTokenResult> Function({bool refresh});
typedef OnUpdateUser = void Function(User user);

class Auth extends ChangeNotifier {
  Auth({
    this.auth,
    this.onUpdateUser,
  }) {
    listenAuthState();
  }

  FirebaseAuth auth;
  OnUpdateUser onUpdateUser;

  StreamSubscription _subscription;

  factory Auth.create({OnUpdateUser onUpdateUser}) {
    print('auth create');
    return Auth(
      auth: FirebaseAuth.instance,
      onUpdateUser: onUpdateUser,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void listenAuthState() {
    _subscription = auth.onAuthStateChanged
        .where((user) => user != null)
        .listen(handleChangeAuthState);
  }

  Future<void> handleChangeAuthState(FirebaseUser user) async {
    final tokenResult = await user.getIdToken();
    final updatedUser = User(
      uid: user.uid,
      token: tokenResult.token,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isEmailVerified: user.isEmailVerified,
      isAnonymous: user.isAnonymous,
      getToken: user.getIdToken,
    );
    onUpdateUser(updatedUser);
  }

  Future<void> signIn({
    String email,
    String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
    } catch (error) {
      return Future.error(error);
    }
  }
}
