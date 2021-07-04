import 'package:json_annotation/json_annotation.dart';

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

  factory Attendance.fromJson(Map<String, dynamic> data) {
    return _$AttendanceFromJson(data);
  }

  int? id;
  @JsonKey(name: 'employee_id')
  int? employeeId;
  @JsonKey(name: 'check_in', fromJson: _dateTimeFalseFromJson)
  DateTime? checkIn;
  @JsonKey(name: 'check_out', fromJson: _dateTimeFalseFromJson)
  DateTime? checkOut;
  @JsonKey(name: 'worked_hours')
  double? workedHours;
  @JsonKey(name: 'create_uid')
  int? createUid;
  @JsonKey(name: 'create_date', fromJson: _dateTimeFalseFromJson)
  DateTime? createDate;
  @JsonKey(name: 'write_uid')
  int? writeUid;
  @JsonKey(name: 'write_date', fromJson: _dateTimeFalseFromJson)
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
    if ([false, null].contains(data))
      return null;
    else
      return DateTime.parse(data as String).add(const Duration(hours: 7));
  }

  @override
  String toString() {
    return 'Attendance(checkIn: ${checkIn})';
  }
}
