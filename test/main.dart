// Package imports:
import 'package:collection/collection.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:intl/intl.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

// Project imports:
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';

void main(List<String> args) {
  var a = '2021-07';
  var b = '2021-08';
  var c = '2021-09';

  var p = {
    a: [
      AttendanceItem([Attendance(id: 1), Attendance(id: 2), Attendance(id: 3)]),
      AttendanceItem([Attendance(id: 1), Attendance(id: 2), Attendance(id: 3)])
    ],
    b: [
      AttendanceItem([Attendance(id: 4), Attendance(id: 5), Attendance(id: 6)]),
      AttendanceItem([Attendance(id: 4), Attendance(id: 5), Attendance(id: 6)])
    ],
  };

  var q = {
    c: [
      AttendanceItem([Attendance(id: 7), Attendance(id: 8), Attendance(id: 9)]),
      AttendanceItem([Attendance(id: 7), Attendance(id: 8), Attendance(id: 9)])
    ],
  };

  var z = [
    AttendanceItem([
      Attendance(id: 1, checkIn: 30.days.ago()),
      Attendance(id: 2, checkIn: 30.days.ago()),
      Attendance(id: 3, checkIn: 30.days.ago())
    ]),
    AttendanceItem([
      Attendance(id: 1, checkIn: 28.days.ago()),
      Attendance(id: 2, checkIn: 28.days.ago()),
      Attendance(id: 3, checkIn: 28.days.ago())
    ]),
    AttendanceItem([
      Attendance(id: 1, checkIn: 28.days.fromNow()),
      Attendance(id: 2, checkIn: 28.days.fromNow()),
      Attendance(id: 3, checkIn: 28.days.fromNow())
    ]),
    AttendanceItem([
      Attendance(id: 1, checkIn: 27.days.fromNow()),
      Attendance(id: 2, checkIn: 27.days.fromNow()),
      Attendance(id: 3, checkIn: 27.days.fromNow())
    ])
  ];
  var y = z.groupListsBy(
    (element) => '${element.checkIn!.year} - ${element.checkIn!.month}',
  );
  print(y.keys);
}
