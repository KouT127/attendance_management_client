import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/http_client.dart';
import 'package:attendance_management/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

typedef GetToken = Future<IdTokenResult> Function({bool refresh});
typedef OnUpdateAppState = void Function({bool initialLoaded});

class Auth {
  Auth({
    this.auth,
  }) {
    listenAuthState();
  }

  final FirebaseAuth auth;
  Stream<FirebaseUser> onAuthStateChanged;

  factory Auth.create() {
    return Auth(auth: FirebaseAuth.instance);
  }

  void listenAuthState() {
    onAuthStateChanged = auth.onAuthStateChanged;
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

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      return Future.error(error);
    }
  }
}

class UserState extends ChangeNotifier {
  UserState({this.locator})
      : auth = locator(),
        client = locator(),
        onUpdateAppState = locator<AppState>().update {
    auth.onAuthStateChanged.listen(handleChangeAuthState);
  }

  final Locator locator;
  final HttpClient client;
  final Auth auth;
  final OnUpdateAppState onUpdateAppState;
  User user;

  factory UserState.create({Locator locator}) {
    SimpleLogger().info('create user state');
    return UserState(locator: locator);
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
}
