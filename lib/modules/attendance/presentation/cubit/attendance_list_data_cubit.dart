import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';

part 'attendance_list_data_state.dart';
part 'attendance_list_data_cubit.freezed.dart';

class AttendanceListDataCubit extends Cubit<AttendanceListDataState> {
  AttendanceListDataCubit({
    required AttendanceRepo attendanceRepo,
  })  : _attendanceRepo = attendanceRepo,
        super(const AttendanceListDataState.initial());

  final AttendanceRepo _attendanceRepo;
  late DateTime _dateTime;

  void fetchAttendanceList(DateTime dateTime) async {
    _dateTime = dateTime;
    await state.maybeWhen(
      fetched: (existing) async => _fetchAttendance(existing),
      orElse: () async => _fetchAttendance(),
    );
  }

  void _fetchAttendance([List<Attendance>? existing]) async {
    emit(const AttendanceListDataState.fetching());
    var result = await _attendanceRepo.getAttendancesByMonth(_dateTime);
    result.when(
      success: (newItem) => emit(
        AttendanceListDataState.fetched([
          ...?existing,
          ...newItem,
        ]),
      ),
      failure: (error) => emit(
        AttendanceListDataState.failed(
          NetworkExceptions.getErrorMessage(error),
        ),
      ),
    );
  }
}
