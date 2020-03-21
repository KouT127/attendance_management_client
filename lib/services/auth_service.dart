import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({
    this.auth,
  });

  final FirebaseAuth auth;

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
