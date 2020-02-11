import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/http_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

typedef GetToken = Future<IdTokenResult> Function({bool refresh});
typedef UpdateAppState = void Function({bool initialLoaded});

class UserState extends ChangeNotifier {
  UserState({
    this.client,
    this.updateAppState,
    FirebaseAuth auth,
  }) : this._auth = auth {
    listenAuthState();
  }

  final HttpClient client;
  final FirebaseAuth _auth;
  final UpdateAppState updateAppState;
  User user;

  factory UserState.create({
    HttpClient client,
    UpdateAppState updateAppState,
  }) {
    print('user state create');
    return UserState(
      client: client,
      auth: FirebaseAuth.instance,
      updateAppState: updateAppState,
    );
  }

  void listenAuthState() {
    _auth.onAuthStateChanged.listen(handleChangeAuthState);
  }

  Future<void> handleChangeAuthState(FirebaseUser user) async {
    final response = await client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: user?.getIdToken,
    );
    print(response.body);
    this.updateAppState(initialLoaded: true);
    if (user == null || user?.uid == null) {
      this.user = User.initial();
      notifyListeners();
      return;
    }
    this.user = User(
      uid: user.uid,
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
      await _auth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      return Future.error(error);
    }
  }
}
