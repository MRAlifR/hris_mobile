import 'package:bloc/bloc.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/generated/intl/messages_en.dart';
import 'package:supercharged_dart/supercharged_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_data_cubit.dart';

part 'attendance_list_view_state.dart';
part 'attendance_list_view_cubit.freezed.dart';

class AttendanceListViewCubit extends Cubit<AttendanceListViewState> {
  AttendanceListViewCubit({
    required AttendanceListDataCubit dataCubit,
  })  : _dataCubit = dataCubit,
        super(const AttendanceListViewState.initial()) {
    var currentDate = DateTime.now();
    AttendanceListViewState.loading(dateTime: currentDate);
    _dataCubit.fetchAttendanceList(DateTime.now());
    _dataCubit.state.maybeWhen(
      fetched: (attendances) {
        var attendanceItems = AttendanceItem.fromAttendances(attendances);
        if (attendanceItems.isEmpty)
          emit(AttendanceListViewState.noData(dateTime: currentDate));
        else
          emit(AttendanceListViewState.success(
            dateTime: currentDate,
            attendances: attendanceItems,
          ));
      },
      orElse: () {},
    );
  }

  final AttendanceListDataCubit _dataCubit;

  void increaseMonth() {
    var currentDate = state
        .maybeWhen(
          loading: (dateTime) => dateTime,
          success: (dateTime, attendances) => dateTime,
          noData: (dateTime) => dateTime,
          orElse: () => DateTime.now(),
        )
        .plus(day: 1);
    _fetchData(currentDate);
  }

  void refreshData() {}

  void decreaseMonth() {
    var currentDate = state
        .maybeWhen(
          loading: (dateTime) => dateTime,
          success: (dateTime, attendances) => dateTime,
          noData: (dateTime) => dateTime,
          orElse: () => DateTime.now(),
        )
        .minus(day: 1);
    _fetchData(currentDate);
  }

  void _fetchData(DateTime currentDate) {
    AttendanceListViewState.loading(dateTime: currentDate);
    _dataCubit.fetchAttendanceList(currentDate);
    _dataCubit.state.maybeWhen(
      fetched: (attendances) {
        var attendanceItems = AttendanceItem.fromAttendances(attendances);
        if (attendanceItems.isEmpty)
          emit(AttendanceListViewState.noData(dateTime: currentDate));
        else
          emit(AttendanceListViewState.success(
            dateTime: currentDate,
            attendances: attendanceItems,
          ));
      },
      failed: (messages) => emit(AttendanceListViewState.failed(messages)),
      orElse: () {},
    );
  }
}
