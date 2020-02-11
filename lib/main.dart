import 'package:attendance_management/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  final logger = SimpleLogger();
  logger.setLevel(Level.INFO, includeCallerInfo: false);
  runApp(Providers());
}
