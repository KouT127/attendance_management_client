import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/services/app_router.dart';
import 'package:attendance_management/services/auth_service.dart';
import 'package:attendance_management/services/http_client_service.dart';
import 'package:attendance_management/services/shared_preference_service.dart';
import 'package:attendance_management/states/app_state.dart';
import 'package:attendance_management/stores/app_store.dart';
import 'package:attendance_management/utlities/utlities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  logger.setLevel(Level.INFO, includeCallerInfo: false);
  await Firebase.initializeApp();
  runApp(Providers());
}

class Providers extends StatelessWidget {
  Providers({Key key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppNavigator()),
        Provider(create: (_) => PreferenceService()),
        Provider(create: (_) => HttpClientService(Client())),
        Provider(
          create: (context) => AuthService(
            auth: firebaseAuth,
            httpClient: context.read(),
          ),
        ),
        StateNotifierProvider<AppStateNotifier, AppState>(
          create: (_) => AppStateNotifier(),
        ),
        Provider(
          create: (context) => AppRouter(
            appStateNotifier: context.read(),
            authService: context.read(),
          ),
        ),
      ],
      child: const App(),
    );
  }
}
