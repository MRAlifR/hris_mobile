import 'dart:ui';

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  Duration get timeDuration => Duration(
        hours: hour,
        minutes: minute,
        seconds: second,
      );

  String get timeToString =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  String dateToString(Locale locale) => DateFormat(
        'EEEE, MMM dd',
        locale.languageCode,
      ).format(this);
}
