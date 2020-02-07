import 'package:attendance_management/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth _auth;
  User user;

  Auth(
    FirebaseAuth auth,
  ) : this._auth = auth;

  factory Auth.initialize() {
    return Auth(
      FirebaseAuth.instance,
    );
  }

  Future<void> handleChangeAuthState(FirebaseUser user) async {
    final tokenResult = await user.getIdToken();
    this.user = User(
      token: tokenResult.token,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isEmailVerified: user.isEmailVerified,
    );
    notifyListeners();
  }

  void listenAuthState() {
    this._auth.onAuthStateChanged.listen(handleChangeAuthState);
  }

  Future<void> signIn({
    String email,
    String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
    } catch (error) {
      return Future.error(error);
    }
  }
}
