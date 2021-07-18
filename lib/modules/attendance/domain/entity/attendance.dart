// Package imports:
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  Attendance({
    this.id,
    this.employeeId,
    this.checkIn,
    this.checkOut,
    this.workedHours,
    this.createUid,
    this.createDate,
    this.writeUid,
    this.writeDate,
    this.address,
    this.addressLink,
    this.browser,
    this.os,
    this.addressOut,
    this.addressLinkOut,
  });

  factory Attendance.fromJson(Map<String, dynamic> data) =>
      _$AttendanceFromJson(data);

  int? id;
  @JsonKey(name: 'employee_id')
  int? employeeId;
  @JsonKey(
    name: 'check_in',
    fromJson: _dateTimeFalseFromJson,
    toJson: _dateTimeFalseToJson,
  )
  DateTime? checkIn;
  @JsonKey(
    name: 'check_out',
    fromJson: _dateTimeFalseFromJson,
    toJson: _dateTimeFalseToJson,
  )
  DateTime? checkOut;
  @JsonKey(name: 'worked_hours')
  double? workedHours;
  @JsonKey(name: 'create_uid')
  int? createUid;
  @JsonKey(
    name: 'create_date',
    fromJson: _dateTimeFalseFromJson,
    toJson: _dateTimeFalseToJson,
  )
  DateTime? createDate;
  @JsonKey(name: 'write_uid')
  int? writeUid;
  @JsonKey(
    name: 'write_date',
    fromJson: _dateTimeFalseFromJson,
    toJson: _dateTimeFalseToJson,
  )
  DateTime? writeDate;
  String? address;
  @JsonKey(name: 'address_link')
  String? addressLink;
  String? browser;
  String? os;
  @JsonKey(name: 'address_out')
  String? addressOut;
  @JsonKey(name: 'address_link_out')
  String? addressLinkOut;

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  static dynamic _dateTimeFalseFromJson(dynamic data) {
    if (data == null)
      return null;
    else {
      if (data is String) data = DateTime.parse(data);
      return data.add(const Duration(hours: 7));
    }
  }

  static dynamic _dateTimeFalseToJson(dynamic data) {
    if (data == null)
      return null;
    else {
      if (data is String) data = DateTime.parse(data);
      return data.subtract(const Duration(hours: 7));
    }
  }

  static List<AttendanceItem> groupByDate(List<Attendance> attendances) {
    var attendanceItems = <AttendanceItem>[];
    var attendanceGroup = attendances.groupListsBy(
      (attendance) {
        if (attendance.checkIn == null) return null;
        var checkIn = attendance.checkIn!;
        return DateFormat('dd-MM-yyyy').format(checkIn);
      },
    );
    for (var key in attendanceGroup.keys) {
      if (attendanceGroup[key]!.isNotEmpty) {
        var att = attendanceGroup[key] as List<Attendance>;
        attendanceItems.add(AttendanceItem(att));
      }
    }
    return attendanceItems;
  }

  @override
  String toString() {
    return 'Attendance(id: $id})';
  }
}
