import 'package:attendance_management/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({
    this.auth,
  });

  final FirebaseAuth auth;

  Stream<User> get firebaseUser =>
      auth.onAuthStateChanged.map(_handleStateChange);

  User _handleStateChange(FirebaseUser user) {
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isEmailVerified: user.isEmailVerified,
      getIdToken: user.getIdToken,
    );
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
