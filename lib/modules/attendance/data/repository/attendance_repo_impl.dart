import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';

class AttendanceRepoImpl extends AttendanceRepo {
  @override
  Future<Result<NetworkExceptions, List<Attendance>>> getAttendancesByMonth(
    DateTime month, [
    int? employeeId = 1724,
  ]) async {
    try {
      var apiCall = ApiCall('http://192.168.1.8:3000/');
      var result = await apiCall.get(
        'attendances',
        queryParameters: {
          'check_in_like': month.toStringAs('yyyy-MM'),
          'employee_id': employeeId,
          '_sort': 'check_in',
          '_order': 'desc'
        },
      ) as List<dynamic>;
      var attendanceList = result.map((e) => Attendance.fromJson(e)).toList();
      return Result.success(attendanceList);
    } catch (e) {
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }
}
