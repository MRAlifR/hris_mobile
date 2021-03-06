// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeExtension on DateTime {
  Duration get timeDuration => Duration(
        hours: hour,
        minutes: minute,
        seconds: second,
      );

  String? get toStringAsTime =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  // Example. Tuesday, Jan 24
  String toStringAsDate([Locale? locale]) => DateFormat(
        'EEEE, MMM dd',
        locale?.languageCode ?? 'id',
      ).format(this);

  String toStringAsMonthYear([Locale? locale]) => DateFormat(
        'MMMM yyyy',
        locale?.languageCode ?? 'id',
      ).format(this);

  String toStringAs(String format) => DateFormat(format).format(this);

  String toStringAsDay([Locale? locale]) => DateFormat(
        'EEE',
        locale?.languageCode ?? 'id',
      ).format(this);

  String toStringAsDateOnly(Locale locale) => day.toString().padLeft(2);

  DateTime replace({int? day, int? month, int? year}) =>
      DateTime(year ?? this.year, month ?? this.month, day ?? this.day);

  DateTime plus({int? day, int? month, int? year}) => Jiffy(this)
      .add(
        days: day ?? 0,
        months: month ?? 0,
        years: year ?? 0,
      )
      .dateTime;

  DateTime minus({int? day, int? month, int? year}) => Jiffy(this)
      .subtract(
        days: day ?? 0,
        months: month ?? 0,
        years: year ?? 0,
      )
      .dateTime;

  DateTime get firstDayOfMonth => DateTime(year, month, 1);
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}
