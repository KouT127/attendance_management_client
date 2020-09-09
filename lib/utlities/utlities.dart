import 'package:intl/intl.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

final dateFormatter = DateFormat('y/MM/dd');
final timeFormatter = DateFormat('HH:mm:ss');

extension DatetimeEx on DateTime {
  String get formattedDate => dateFormatter.format(this);

  String get formattedTime => timeFormatter.format(this);
}
