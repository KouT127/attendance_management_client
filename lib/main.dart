import 'package:attendance_management/providers.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  logger.setLevel(Level.INFO, includeCallerInfo: false);
  await Firebase.initializeApp();
  runApp(Providers());
}
