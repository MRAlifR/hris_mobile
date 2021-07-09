// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';

part 'attendance_list_state.dart';
part 'attendance_list_cubit.freezed.dart';

class AttendanceListCubit extends HydratedCubit<AttendanceListState> {
  AttendanceListCubit({
    required AttendanceRepo attendanceRepo,
  })  : _attendanceRepo = attendanceRepo,
        super(const AttendanceListState.initial()) {
    // getAttendances(DateTime.now());
  }

  final AttendanceRepo _attendanceRepo;
  Map<String, List<AttendanceItem>> get _mapAttendance => state.maybeMap(
        success: (x) => x.allAttendances,
        orElse: () => {},
      );

  @override
  AttendanceListState? fromJson(Map<String, dynamic> json) {
    print('JALAN FROMJSON');
    var listJson = json['attendances'];
    if (listJson.isEmpty) return null;

    var attendances = List<Attendance>.from(
      listJson.map((e) => Attendance.fromJson(e)),
    );
    var items = Attendance.groupByDate(attendances);
    var groupedItems = AttendanceItem.groupByMonth(items);

    var currentDate = DateTime.now();
    var filteredItems = items
        .filter((item) =>
            item.checkIn!.toStringAs('MM-yyyy') ==
            currentDate.toStringAs('MM-yyyy'))
        .toList();

    return AttendanceListState.success(
      attendances: filteredItems,
      allAttendances: groupedItems,
      minDate: currentDate.firstDayOfMonth,
      maxDate: _getMaxDate(DateTime.now(), filteredItems),
    );
  }

  @override
  Map<String, dynamic>? toJson(AttendanceListState state) {
    return state.maybeMap(
      success: (states) {
        var attendances = AttendanceItem.toAttendances(states.allAttendances);
        var listJson = attendances.map((e) => e.toJson()).toList();
        return {'attendances': listJson};
      },
      orElse: () => null,
    );
  }

  void getAttendances(DateTime dateTime) async {
    _fetchLocalData(dateTime).map(
      failure: (_) async {
        print(_);
        await _fetchRemoteData(dateTime);
      },
      success: print,
    );
  }

  Future<void> _fetchRemoteData(DateTime dateTime) async {
    var allAttendances = _mapAttendance;
    emit(const AttendanceListState.loading());
    var result = await _attendanceRepo.getAttendancesByMonth(dateTime);
    result.when(
      success: (attendances) {
        if (attendances!.isEmpty) {
          emit(const AttendanceListState.empty());
        } else {
          var dateParam = dateTime.toStringAs('MM-yyyy');
          allAttendances[dateParam] = attendances;
          emit(AttendanceListState.success(
            allAttendances: allAttendances,
            minDate: dateTime.firstDayOfMonth,
            maxDate: _getMaxDate(dateTime, attendances),
            attendances: attendances,
          ));
        }
      },
      failure: (error) => emit(AttendanceListState.failed(
        message: NetworkExceptions.getErrorMessage(error!),
      )),
    );
  }

  Result _fetchLocalData(DateTime dateTime) {
    print('MAP $_mapAttendance');
    if (_mapAttendance.isEmpty) return Result.failure('Not found');

    var dateParam = dateTime.toStringAs('MM-yyyy');
    var attendances = _mapAttendance.filter((item) => item.key == dateParam);
    print('ATTE $attendances ${_mapAttendance.keys} $dateParam');
    if (attendances.isEmpty) return Result.failure('Not found');

    emit(AttendanceListState.success(
      minDate: dateTime.firstDayOfMonth,
      maxDate: _getMaxDate(dateTime, attendances.first.value),
      attendances: attendances.first.value,
      allAttendances: _mapAttendance,
    ));
    return Result.success('Success');
  }

  DateTime _getMaxDate(DateTime dateTime, List<AttendanceItem> attendances) {
    var maxCheckIn = dateTime.lastDayOfMonth;
    var currentDate = DateTime.now();
    if (dateTime.month == currentDate.month &&
        dateTime.year == currentDate.year) {
      var checkIns = attendances.map((e) => e.checkIn).toList();
      print(checkIns);
      if (checkIns.isNotEmpty)
        maxCheckIn = checkIns.reduce((a, b) => a!.isAfter(b!) ? a : b)!;
    }
    return maxCheckIn;
  }
}
