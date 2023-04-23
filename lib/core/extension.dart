import 'package:intl/intl.dart';

extension DayTimeFormat on DateTime {
  String format(String formatter) {
    final DateFormat dateFormat = DateFormat(formatter);
    return dateFormat.format(this);
  }
}
