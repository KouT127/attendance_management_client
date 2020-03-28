import 'package:async_redux/async_redux.dart';
import 'package:attendance_management/models/app_state.dart';
import 'package:attendance_management/services/auth_router.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

import 'app.dart';
import 'services/services.dart';

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();
  final store = Store<AppState>(initialState: AppState());
  final auth = FirebaseAuth.instance;
  final client = Client();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppNavigator(navigatorKey: navigatorKey)),
        Provider(create: (_) => PreferenceService()),
        Provider(create: (_) => HttpClientService(client)),
        Provider(create: (_) => AuthService(auth: auth)),
      ],
      child: AsyncReduxProvider<AppState>(
        builder: (_) => store,
        child: Provider(
          create: (_context) => AuthRouter(
            auth: auth,
            store: store,
            locator: _context.read,
          )..listen(),
          dispose: (_, AuthRouter router) => router..dispose(),
          child: const App(),
        ),
      ),
    );
  }
}
