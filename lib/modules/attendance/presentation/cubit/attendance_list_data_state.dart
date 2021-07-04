part of 'attendance_list_data_cubit.dart';

@freezed
class AttendanceListDataState with _$AttendanceListDataState {
  const factory AttendanceListDataState.initial() = _Initial;
  const factory AttendanceListDataState.fetching() = _Fetching;
  const factory AttendanceListDataState.fetched(
    List<Attendance> attendances,
  ) = _Fetched;
  const factory AttendanceListDataState.failed(
    String error,
  ) = _Failed;
}
