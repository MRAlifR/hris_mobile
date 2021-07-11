import 'package:hive/hive.dart';
import 'package:hris_mobile/core/utils/logger.dart';
import 'package:hris_mobile/core/utils/result.dart';
import 'package:hris_mobile/core/error/network_exceptions.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:logger/logger.dart';

final _log = Logger(printer: SimpleLogPrinter('AttendanceLocalSource'));

abstract class IAttendanceLocalSource {
  List<Attendance> getAttendance();

  Future<void> saveAttendance(List<Attendance> attendances);
}

class AttendanceLocalSource extends IAttendanceLocalSource {
  AttendanceLocalSource({
    required Box box,
  }) : _box = box;

  final Box _box;
  static const attendanceLocalKey = 'attendances';

  @override
  List<Attendance> getAttendance() {
    try {
      final result = _box.get(attendanceLocalKey) ?? [];
      var listAttendance = <Attendance>[];
      if (result.isNotEmpty) {
        _log.i('GET ${result.length} DATA');

        listAttendance = List<Attendance>.from(
          result.map((e) {
            return Attendance.fromJson(Map<String, dynamic>.from(e));
          }),
        );
      }
      return listAttendance;
    } catch (e) {
      _log.e(e);

      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<void> saveAttendance(List<Attendance> attendances) async {
    _log.i('SAVING ${attendances.length} DATA');

    var jsonList = attendances.map((e) => e.toJson()).toList();
    await _box.put(attendanceLocalKey, jsonList);
  }
}
