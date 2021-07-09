// Project imports:
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';

abstract class AttendanceRepo {
  Future<Result<NetworkExceptions, List<AttendanceItem>>> getAttendancesByMonth(
    DateTime month, [
    int? employeeId,
  ]);
}
