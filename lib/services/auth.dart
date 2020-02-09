import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

typedef Future<IdTokenResult> GetToken({bool refresh});

class Auth extends ChangeNotifier {
  Auth(this.auth);

  FirebaseAuth auth;
  User user;
  StreamSubscription _subscription;

  factory Auth.create() {
    print('auth create');
    return Auth(
      FirebaseAuth.instance,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void listenAuthState() {
    _subscription = auth.onAuthStateChanged.listen(handleChangeAuthState);
  }

  Future<void> handleChangeAuthState(FirebaseUser user) async {
    final tokenResult = await user.getIdToken();
    this.user = User(
      uid: user.uid,
      token: tokenResult.token,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isEmailVerified: user.isEmailVerified,
      getToken: user.getIdToken,
    );
    notifyListeners();
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
