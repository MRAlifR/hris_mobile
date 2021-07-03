import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';

class AttendanceRepoImpl extends AttendanceRepo {
  @override
  Future<Result<NetworkExceptions, List<Attendance>>> getAttendanceList([
    int? employeeId,
  ]) async {
    try {
      var apiCall = ApiCall('http://192.168.43.67:3000/');
      var result = await apiCall.get('attendance') as List<dynamic>;
      var attendanceList = result.map((e) => Attendance.fromJson(e)).toList();
      print('AIYAAAA ${attendanceList[10]}');
      return Result.success(attendanceList);
    } catch (e) {
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }
}
