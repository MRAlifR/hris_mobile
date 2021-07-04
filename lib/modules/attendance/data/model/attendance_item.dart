import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

part 'attendance_item.freezed.dart';

@freezed
class AttendanceItem with _$AttendanceItem {
  const AttendanceItem._(); // Added constructor
  const factory AttendanceItem(List<Attendance> attendances) = _AttendanceItem;

  DateTime? get checkIn {
    var checkInList = attendances.map((e) => e.checkIn);
    return checkInList.reduce((a, b) => a!.isBefore(b!) ? a : b);
  }

  DateTime? get checkOut {
    var checkOutList = attendances.map((e) => e.checkOut);
    return checkOutList.reduce((a, b) => a!.isAfter(b!) ? a : b);
  }

  double? get workedHours {
    var durationInSecond = checkOut?.difference(checkIn!).inSeconds;
    return durationInSecond! / 3600;
  }

  static List<AttendanceItem> fromAttendances(
    List<Attendance> attendances,
  ) {
    var attendanceItems = <AttendanceItem>[];
    var attendanceGroup = attendances.groupListsBy(
      (attendance) => DateFormat('dd-MM-yyyy').format(attendance.checkIn!),
    );
    for (var key in attendanceGroup.keys) {
      if (attendanceGroup[key]!.isNotEmpty) {
        var att = attendanceGroup[key] as List<Attendance>;
        attendanceItems.add(AttendanceItem(att));
      }
    }
    return attendanceItems;
  }
}
