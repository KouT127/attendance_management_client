import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/http_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';

typedef GetToken = Future<IdTokenResult> Function({bool refresh});
typedef OnUpdateAppState = void Function({bool initialLoaded});

class UserState extends ChangeNotifier {
  UserState({
    this.client,
    this.onUpdateAppState,
    FirebaseAuth auth,
  }) : this._auth = auth {
    listenAuthState();
  }

  final HttpClient client;
  final FirebaseAuth _auth;
  final OnUpdateAppState onUpdateAppState;
  User user;

  factory UserState.create({
    HttpClient client,
    OnUpdateAppState onUpdateAppState,
  }) {
    SimpleLogger().info('create user state');
    return UserState(
      client: client,
      auth: FirebaseAuth.instance,
      onUpdateAppState: onUpdateAppState,
    );
  }

  void listenAuthState() {
    _auth.onAuthStateChanged.listen(handleChangeAuthState);
  }

  Future<void> handleChangeAuthState(FirebaseUser user) async {
    this.onUpdateAppState(initialLoaded: true);
    final response = await client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: user?.getIdToken,
    );
    SimpleLogger().info(response.body);
    if (response.statusCode >= 400) {
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
