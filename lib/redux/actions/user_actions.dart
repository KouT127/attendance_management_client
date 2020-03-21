import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/models.dart';
import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/utils/utils.dart';

class LoadUser extends ReduxAction<AppState> {
  final HttpClientService client;
  final UserState userState;

  LoadUser({
    this.client,
    this.userState,
  });

  @override
  Future<AppState> reduce() async {
    final response = await client.get(
      'http://localhost:8080/v1/users/mine',
      getToken: userState?.getIdToken,
    );
    logger.info(response.body);
    if (response.statusCode >= 400) {
      return state.copyWith(
        initialLoaded: true,
        userState: UserState(),
      );
    }
    final newUser = UserState(
      uid: userState.uid,
      email: userState.email,
      displayName: userState.displayName,
      photoUrl: userState.photoUrl,
      isEmailVerified: userState.isEmailVerified,
      getIdToken: userState.getIdToken,
    );
    return state.copyWith(
      initialLoaded: true,
      userState: newUser,
    );
  }
}
