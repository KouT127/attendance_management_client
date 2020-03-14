import 'package:attendance_management/providers.dart';
import 'package:attendance_management/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  logger.setLevel(Level.INFO, includeCallerInfo: false);
  runApp(Providers());
}
