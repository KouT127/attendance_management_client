import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_logger/simple_logger.dart';

class UserStore {
  UserStore({this.locator})
      : _auth = locator(),
        _client = locator(),
        _appStore = locator<AppStore>() {
    _auth.firebaseUser.listen(handleChangeAuthState);
  }

  final Locator locator;
  final HttpClientService _client;
  final AuthService _auth;
  final AppStore _appStore;

  final PublishSubject<User> _user = PublishSubject();

  Stream<User> get user => _user.stream;

  void dispose() {
    _user.close();
  }

  Future<void> handleChangeAuthState(User user) async {
    final response = await _client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: user?.getIdToken,
    );
    _appStore.loaded();
    SimpleLogger().info(response.body);
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
