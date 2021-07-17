// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/core/utils/logger.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/i_attendance_repo.dart';

part 'attendance_list_state.dart';
part 'attendance_list_cubit.freezed.dart';

final _log = Logger(printer: SimpleLogPrinter('AttendanceListCubit'));

class AttendanceListCubit extends Cubit<AttendanceListState> {
  AttendanceListCubit({
    required IAttendanceRepo attendanceRepo,
  })  : _attendanceRepo = attendanceRepo,
        super(const AttendanceListState.initial()) {
    getAttendanceList(DateTime.now());
  }

  final IAttendanceRepo _attendanceRepo;

  Future<void> getAttendanceList(DateTime dateTime) async {
    _log.i('DATE PARAM $dateTime');
    emit(const AttendanceListState.loading());
    var result = await _attendanceRepo.getAttendanceByMonth(month: dateTime);
    result.when(
      success: (attendances) {
        _log.i('ATTENDANCES DATA ${attendances?.length}');
        attendances!.isEmpty
            ? emit(const AttendanceListState.empty())
            : emit(AttendanceListState.success(
                minDate: dateTime.firstDayOfMonth,
                maxDate: _getMaxDate(dateTime, attendances),
                attendances: attendances,
              ));
      },
      failure: (error) {
        _log.e(error);
        emit(AttendanceListState.failed(
          message: NetworkExceptions.getErrorMessage(error!),
        ));
      },
    );
  }

  Future<void> refreshAttendanceList(DateTime dateTime) async {
    _log.i('DATE PARAM $dateTime');
    var result = await _attendanceRepo.refreshAttendance(month: dateTime);
    result.when(
      success: (attendances) {
        _log.i('ATTENDANCES DATA ${attendances?.length}');
        emit(const AttendanceListState.loading());
        attendances!.isEmpty
            ? emit(const AttendanceListState.empty())
            : emit(AttendanceListState.success(
                minDate: dateTime.firstDayOfMonth,
                maxDate: _getMaxDate(dateTime, attendances),
                attendances: attendances,
              ));
      },
      failure: (error) {
        _log.e(error);
        emit(AttendanceListState.failed(
          message: NetworkExceptions.getErrorMessage(error!),
        ));
      },
    );
  }

  DateTime _getMaxDate(DateTime dateTime, List<AttendanceItem> attendances) {
    var maxCheckIn = dateTime.lastDayOfMonth;
    var currentDate = DateTime.now();
    if (dateTime.month == currentDate.month &&
        dateTime.year == currentDate.year) {
      var checkIns = attendances.map((e) => e.checkIn).toList();
      if (checkIns.isNotEmpty)
        maxCheckIn = checkIns.reduce((a, b) => a!.isAfter(b!) ? a : b)!;
    }
    return maxCheckIn;
  }
}
