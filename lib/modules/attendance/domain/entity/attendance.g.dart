// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return Attendance(
    id: json['id'] as int?,
    employeeId: json['employee_id'] as int?,
    checkIn: Attendance._dateTimeFalseFromJson(json['check_in']),
    checkOut: Attendance._dateTimeFalseFromJson(json['check_out']),
    workedHours: (json['worked_hours'] as num?)?.toDouble(),
    createUid: json['create_uid'] as int?,
    createDate: Attendance._dateTimeFalseFromJson(json['create_date']),
    writeUid: json['write_uid'] as int?,
    writeDate: Attendance._dateTimeFalseFromJson(json['write_date']),
    address: json['address'] as String?,
    addressLink: json['address_link'] as String?,
    browser: json['browser'] as String?,
    os: json['os'] as String?,
    addressOut: json['address_out'] as String?,
    addressLinkOut: json['address_link_out'] as String?,
  );
}

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'check_in': instance.checkIn?.toIso8601String(),
      'check_out': instance.checkOut?.toIso8601String(),
      'worked_hours': instance.workedHours,
      'create_uid': instance.createUid,
      'create_date': instance.createDate?.toIso8601String(),
      'write_uid': instance.writeUid,
      'write_date': instance.writeDate?.toIso8601String(),
      'address': instance.address,
      'address_link': instance.addressLink,
      'browser': instance.browser,
      'os': instance.os,
      'address_out': instance.addressOut,
      'address_link_out': instance.addressLinkOut,
    };
