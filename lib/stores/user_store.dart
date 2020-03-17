import 'dart:async';

import 'package:attendance_management/models/user.dart';
import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/services/services.dart';
import 'package:attendance_management/stores/stores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:state_notifier/state_notifier.dart';

class UserStateNotifier extends StateNotifier<User> with LocatorMixin {
  UserStateNotifier({this.user}) : super(const User());

  FirebaseUser user;

  AppStateNotifier get _appState => read();

  @override
  void initState() {
    this.handleChangeAuthState(user);
    super.initState();
  }

  Future<void> handleChangeAuthState(FirebaseUser authUser) async {
    _appState.state;
    final client = read<HttpClientService>();
    final response = await client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: authUser?.getIdToken,
    );
    _appState.loaded();
    SimpleLogger().info(response.body);
    if (response.statusCode >= 400) {
      state = User();
      return;
    }
    state = User(
      uid: authUser.uid,
      email: authUser.email,
      displayName: authUser.displayName,
      photoUrl: authUser.photoUrl,
      isEmailVerified: authUser.isEmailVerified,
      getIdToken: authUser.getIdToken,
    );
  }
}
