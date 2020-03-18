import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class UserState {
  UserState({
    this.locator,
  }) {
    _auth.firebaseUser.listen(handleChangeAuthState);
  }

  final Locator locator;

  final PublishSubject<User> _user = PublishSubject();

  Stream<User> get user => _user.stream;

  AuthService get _auth => locator();

  HttpClientService get _client => locator();

  AppStore get _appStore => locator();

  void dispose() {
    _user.close();
  }

  Future<void> handleChangeAuthState(User user) async {
    final response = await _client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: user?.getIdToken,
    );
    _appStore.loaded();
    logger.info(response.body);
    if (response.statusCode >= 400) {
      _user.add(User());
      return;
    }
    final newUser = User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isEmailVerified: user.isEmailVerified,
      getIdToken: user.getIdToken,
    );
    _user.add(newUser);
  }
}
