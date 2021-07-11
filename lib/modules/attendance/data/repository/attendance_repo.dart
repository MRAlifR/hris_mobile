// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/logger.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/attendance_local_source.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/attendance_remote_source.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/i_attendance_repo.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:supercharged/supercharged.dart';

final _log = Logger(printer: SimpleLogPrinter('AttendanceRepo'));

class AttendanceRepo extends IAttendanceRepo {
  AttendanceRepo({
    required IAttendanceLocalSource localSource,
    required IAttendanceRemoteSource remoteSource,
  })  : _localSource = localSource,
        _remoteSource = remoteSource;

  static const monthFormat = 'MM-yyyy';
  final IAttendanceLocalSource _localSource;
  final IAttendanceRemoteSource _remoteSource;
  final currentDate = DateTime.now().toStringAs(monthFormat);

  late DateTime month;
  late int employeeId;

  @override
  Future<Result<NetworkExceptions, List<AttendanceItem>>> getAttendanceByMonth({
    required DateTime month,
    int? employeeId = 1724,
  }) async {
    this.month = month;
    this.employeeId = employeeId!;

    final dateParam = month.toStringAs(monthFormat);
    if (dateParam == currentDate) {
      return _remoteFirstThenLocal();
    } else {
      return _localFirstThenRemote();
    }
  }

  @override
  Future<Result<NetworkExceptions, List<AttendanceItem>>> refreshAttendance({
    required DateTime month,
    int? employeeId = 1724,
  }) async {
    this.month = month;
    this.employeeId = employeeId!;
    return _remoteFirstThenLocal();
  }

  Future<Result<NetworkExceptions, List<AttendanceItem>>>
      _remoteFirstThenLocal() async {
    try {
      var attendances = await _getRemoteData();
      return Result.success(Attendance.groupByDate(attendances));
    } catch (e) {
      try {
        var attendances = _getLocalData();
        return Result.success(Attendance.groupByDate(attendances));
      } catch (e) {
        return Result.failure(NetworkExceptions.getDioException(e));
      }
    }
  }

  Future<Result<NetworkExceptions, List<AttendanceItem>>>
      _localFirstThenRemote() async {
    try {
      var attendances = _getLocalData();
      if (attendances.isNotEmpty)
        return Result.success(Attendance.groupByDate(attendances));

      var attendancesRemote = await _getRemoteData();
      return Result.success(Attendance.groupByDate(attendancesRemote));
    } catch (e) {
      _log.e(e);
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<List<Attendance>> _getRemoteData() async {
    var attendances = await _remoteSource.getAttendanceByMonth(
      month: month,
      employeeId: employeeId,
    );

    _log.d('REMOTE DATA = ${attendances.length}');

    if (attendances.isNotEmpty)
      _updateLocalData(attendances, _localSource.getAttendance());
    return attendances;
  }

  List<Attendance> _getLocalData() {
    var allAttendances = _localSource.getAttendance();

    _log.d('LOCAL DATA = ${allAttendances.length}');

    var attendances = allAttendances.filter(
      (attendance) =>
          attendance.checkIn!.toStringAs(monthFormat) ==
          month.toStringAs(monthFormat),
    );

    _log.d('FILTERED LOCAL DATA = ${attendances.length}');

    return attendances.toList();
  }

  void _updateLocalData(
    List<Attendance> remoteData,
    List<Attendance> localData,
  ) {
    var monthRemote = remoteData.first.checkIn!.toStringAs(monthFormat);
    var filteredLocalData = localData.filter(
      (e) => e.checkIn!.toStringAs(monthFormat) != monthRemote,
    );
    var saved = [...remoteData, ...filteredLocalData];
    _localSource.saveAttendance(saved);
  }
}
