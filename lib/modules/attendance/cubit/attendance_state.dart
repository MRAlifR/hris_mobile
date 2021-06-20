part of 'attendance_cubit.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    @Default(AttendanceStatus.checkIn) AttendanceStatus attendanceStatus,
    String? currentDate,
    @Default(Duration.zero) Duration checkInDuration,
    @Default(Duration.zero) Duration checkOutDuration,
    @Default('--:--') String checkIn,
    @Default('--:--') String checkOut,
    @Default('--:--') String workHour,
  }) = _AttendanceState;
}
