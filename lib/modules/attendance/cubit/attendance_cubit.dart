import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/utils/extension/extension.dart';

part 'attendance_state.dart';
part 'attendance_cubit.freezed.dart';

enum AttendanceStatus {
  checkIn,
  checkOut,
}

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this._locale)
      : super(AttendanceState(
          attendanceStatus: AttendanceStatus.checkIn,
          currentDate: DateTime.now().dateToString(_locale),
          checkInDuration: Duration.zero,
          checkOutDuration: Duration.zero,
          checkIn: '--:--',
          checkOut: '--:--',
          workHour: '--:--',
        ));

  final Locale _locale;

  void checkInButton() {
    emit(state.copyWith(
      attendanceStatus: AttendanceStatus.checkOut,
      currentDate: DateTime.now().dateToString(_locale),
      checkIn: DateTime.now().timeToString,
      checkInDuration: DateTime.now().timeDuration,
    ));
  }

  void checkOutButton() {
    var currentDate = DateTime.now();
    emit(state.copyWith(
      attendanceStatus: AttendanceStatus.checkIn,
      currentDate: DateTime.now().dateToString(_locale),
      checkOut: currentDate.timeToString,
      checkOutDuration: currentDate.timeDuration,
      workHour: currentDate.timeDuration
          .timeSubstract(state.checkInDuration)
          .timeToString,
    ));
  }
}
