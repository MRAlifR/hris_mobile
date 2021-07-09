import 'package:hive/hive.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/i_attendance_data_source.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';

class AttendanceLocalSource extends IAttendanceDataSource {
  AttendanceLocalSource({required Box box}) : _box = box;

  final Box _box;

  @override
  Future<Result<NetworkExceptions, List<Attendance>>> getAttendancesByMonth({
    required DateTime month,
    int? employeeId = 1724,
  }) async {
    try {
      final result = _box.get('attendances') as List<Map<String, dynamic>>;
      if (result.isNotEmpty) {
        var attendanceList = result.map((e) => Attendance.fromJson(e)).toList();
        return Result.success(attendanceList);
      }
      // ignore: only_throw_errors
      throw const NetworkExceptions.notFound('Data not found');
    } catch (e) {
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<void> saveAttendance(List<Attendance> attendances) async {
    var jsonList = attendances.map((e) => e.toJson()).toList();
    await _box.put('attendances', jsonList);
  }
}
