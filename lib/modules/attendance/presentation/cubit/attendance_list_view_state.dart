part of 'attendance_list_view_cubit.dart';

@freezed
class AttendanceListViewState with _$AttendanceListViewState {
  const factory AttendanceListViewState.initial() = _Initial;
  const factory AttendanceListViewState.failed(String message) = _Failed;

  const factory AttendanceListViewState.loading({
    required DateTime dateTime,
  }) = _Loading;

  const factory AttendanceListViewState.noData({
    required DateTime dateTime,
  }) = _NoData;

  const factory AttendanceListViewState.success({
    required DateTime dateTime,
    required List<AttendanceItem> attendances,
  }) = _Success;
}
