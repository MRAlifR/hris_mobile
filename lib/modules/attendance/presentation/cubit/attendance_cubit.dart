import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/location_cubit.dart';
import 'package:hris_mobile/core/extension/extension.dart';

part 'attendance_state.dart';
part 'attendance_cubit.freezed.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit({
    required Locale locale,
    required LocationCubit locationCubit,
  })  : _locale = locale,
        _locationCubit = locationCubit,
        super(AttendanceState.initial(
          currentDate: DateTime.now().toStringAsDate(locale),
        ));

  final Locale _locale;
  final LocationCubit _locationCubit;

  void checkInButton() {
    var _currentDate = DateTime.now();
    emit(
      AttendanceState.checkIn(
        currentDate: DateTime.now().toStringAsDate(_locale),
        checkIn: _currentDate.toStringAsTime,
        checkInAddress: getAddress(),
        checkInDuration: _currentDate.timeDuration,
      ),
    );
  }

  void checkOutButton() {
    var _currentDate = DateTime.now();
    state.maybeMap(
      checkIn: (checkInState) {
        emit(AttendanceState.checkOut(
          currentDate: _currentDate.toStringAsDate(_locale),
          checkIn: checkInState.checkIn,
          checkInAddress: checkInState.checkInAddress,
          checkInDuration: checkInState.checkInDuration,
          checkOut: _currentDate.toStringAsTime,
          checkOutAddress: getAddress(),
          checkOutDuration: _currentDate.timeDuration,
          workHour: _currentDate.timeDuration
              .substractTime(checkInState.checkInDuration)
              .toStringAsTime,
        ));
      },
      orElse: () {
        emit(AttendanceState.initial(
          currentDate: _currentDate.toStringAsDate(_locale),
        ));
      },
    );
  }

  String getAddress() => _locationCubit.state.maybeMap(
        changed: (state) => state.address,
        failed: (state) => state.message,
        orElse: () => 'Location not found',
      );
}
