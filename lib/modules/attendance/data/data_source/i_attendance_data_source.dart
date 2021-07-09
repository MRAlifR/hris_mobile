// Project imports:
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';

abstract class IAttendanceDataSource {
  Future<Result<NetworkExceptions, List<Attendance>>> getAttendancesByMonth({
    required DateTime month,
    int? employeeId,
  });
}
