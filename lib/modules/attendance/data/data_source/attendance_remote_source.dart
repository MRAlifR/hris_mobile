// Package imports:
import 'package:logger/logger.dart';

// Project imports:
import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/logger.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';

final _log = Logger(printer: SimpleLogPrinter('AttendanceRemoteSource'));

abstract class IAttendanceRemoteSource {
  Future<List<Attendance>> getAttendanceByMonth({
    required DateTime month,
    int? employeeId,
  });
}

class AttendanceRemoteSource extends IAttendanceRemoteSource {
  AttendanceRemoteSource({required ApiCall apiCall}) : _apiCall = apiCall;

  final ApiCall _apiCall;

  @override
  Future<List<Attendance>> getAttendanceByMonth({
    required DateTime month,
    int? employeeId = 1724,
  }) async {
    try {
      var listAttendance = <Attendance>[];
      var result = await _apiCall.get(
        'attendances',
        queryParameters: {
          'check_in_like': month.toStringAs('yyyy-MM'),
          'employee_id': employeeId,
          '_sort': 'check_in',
          '_order': 'desc'
        },
      ) as List<dynamic>;

      _log.i('GET ${result.length} DATA');

      if (result.isNotEmpty)
        listAttendance = result.map((e) => Attendance.fromJson(e)).toList();
      return listAttendance;
    } catch (e) {
      _log.e(e);

      throw NetworkExceptions.getDioException(e);
    }
  }
}
