// Package imports:
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';

// Project imports:

part 'attendance_item.freezed.dart';

@freezed
class AttendanceItem with _$AttendanceItem {
  const AttendanceItem._(); // Added constructor
  const factory AttendanceItem(List<Attendance> attendances) = _AttendanceItem;

  DateTime? get checkIn {
    var checkInList = attendances.map((e) => e.checkIn);
    if (checkInList.isEmpty) return null;
    return checkInList.reduce((a, b) => a!.isBefore(b!) ? a : b);
  }

  DateTime? get checkOut {
    var checkOutList = attendances.map((e) => e.checkOut);
    if (checkOutList.isEmpty) return null;
    print(checkOutList);
    return checkOutList.reduce((a, b) => a!.isAfter(b!) ? a : b);
  }

  double get workedHours {
    if (checkIn == null) return 0;
    var durationInSecond = checkOut?.difference(checkIn!).inSeconds ?? 0;
    return durationInSecond / 3600;
  }

  // Group by month
  static Map<String, List<AttendanceItem>> groupByMonth(
    List<AttendanceItem> items,
  ) {
    var attendanceGroup = items.groupListsBy(
      (item) => item.checkIn!.toStringAs('MM-yyyy'),
    );
    return attendanceGroup;
  }

  static List<Attendance> toAttendances(
    Map<String, List<AttendanceItem>> allItems,
  ) {
    var items = allItems.values.flattened;
    return items.map((e) => e.attendances).flattened.toList();
  }
}
