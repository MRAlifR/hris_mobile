part of 'attendance_list_cubit.dart';

@freezed
class AttendanceListState with _$AttendanceListState {
  const factory AttendanceListState.initial() = _Initial;
  const factory AttendanceListState.loading() = _Loading;
  const factory AttendanceListState.empty() = _Empty;

  const factory AttendanceListState.success({
    required DateTime minDate,
    required DateTime maxDate,
    required List<AttendanceItem> attendances,
    required Map<String, List<AttendanceItem>> allAttendances,
  }) = _Success;

  const factory AttendanceListState.failed({
    required String message,
  }) = _Failed;
}
