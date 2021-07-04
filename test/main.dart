import 'package:collection/collection.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:intl/intl.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

void main(List<String> args) {
  var attendances = [
    Attendance(
      checkIn: 2.days.ago() - 4.hours,
      checkOut: 2.days.ago() - 3.hours,
    ),
    Attendance(
      checkIn: 2.days.ago() - 1.hours,
      checkOut: 2.days.ago() + 3.hours,
    ),
    Attendance(
      checkIn: 5.days.ago() - 4.hours,
      checkOut: 5.days.ago() - 3.hours,
    ),
    Attendance(
      checkIn: 5.days.ago() - 1.hours,
      checkOut: 5.days.ago() + 3.hours,
    ),
  ];

  var auw = AttendanceItem.fromAttendances(attendances);
  print(auw);

  // print(at.checkIn);
  // print(at.checkOut);
  // print(at.workedHours);
}
