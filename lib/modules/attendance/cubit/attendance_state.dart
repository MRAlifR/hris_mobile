part of 'attendance_cubit.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState.initial({
    required String currentDate,
  }) = _Initial;

  const factory AttendanceState.checkIn({
    required String currentDate,
    required String checkInAddress,
    required Duration checkInDuration,
    required String checkIn,
  }) = _CheckIn;

  const factory AttendanceState.checkOut({
    required String currentDate,
    required String checkInAddress,
    required String checkOutAddress,
    required Duration checkInDuration,
    required Duration checkOutDuration,
    required String checkIn,
    required String checkOut,
    required String workHour,
  }) = _CheckOut;
}
