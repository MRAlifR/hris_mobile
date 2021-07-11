// Project imports:
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';

abstract class IAttendanceRepo {
  Future<Result<NetworkExceptions, List<AttendanceItem>>> getAttendanceByMonth({
    required DateTime month,
    int? employeeId,
  });

  Future<Result<NetworkExceptions, List<AttendanceItem>>> refreshAttendance({
    required DateTime month,
    int? employeeId = 1724,
  });
}
