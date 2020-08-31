import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/states/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

extension UserEx on User {
  bool equal(User user) {
    final distinct = uid == user?.uid &&
        email == user?.email &&
        photoURL == user?.photoURL &&
        emailVerified == user?.emailVerified &&
        phoneNumber == user?.phoneNumber &&
        displayName == user?.displayName &&
        metadata.creationTime == user?.metadata?.creationTime &&
        metadata.lastSignInTime == user?.metadata?.lastSignInTime &&
        isAnonymous == user?.isAnonymous &&
        tenantId == user?.tenantId;
    return distinct;
  }
}

class AuthService {
  AuthService({
    this.httpClient,
    this.auth,
  });

  final HttpClientService httpClient;
  final FirebaseAuth auth;
  UserState _userState = UserState();

  UserState get currentUser => _userState;

  Stream<UserState> get currentUserStream => auth
      .authStateChanges()
      .distinct((prev, next) => prev?.equal(next) ?? false)
      .asyncMap(fetchUserOnAuthChanged);

  Future<UserState> fetchUserOnAuthChanged(User user) async {
    debugPrint("Updated Auth Info: ${user.toString()}");
    if (user == null || user?.uid == null) {
      return UserState();
    }

    try {
      final userState = await httpClient.getUserMine();
    } on Exception catch (e, s) {
      return UserState();
    }
    _userState = UserState(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
      emailVerified: user.emailVerified,
      getIdToken: auth?.currentUser?.getIdToken,
    );
    return _userState;
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
