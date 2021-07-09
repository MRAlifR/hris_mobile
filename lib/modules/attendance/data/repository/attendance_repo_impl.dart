// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';

class AttendanceRepoImpl extends AttendanceRepo {
  @override
  Future<Result<NetworkExceptions, List<AttendanceItem>>> getAttendancesByMonth(
    DateTime month, [
    int? employeeId = 1724,
  ]) async {
    try {
      var apiCall = ApiCall('https://exercisemralifr.herokuapp.com/');
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
      return Result.success(Attendance.groupByDate(attendanceList));
    } catch (e) {
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }
}
