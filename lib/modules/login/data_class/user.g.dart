// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    employeeId: json['employee_id'] as List<dynamic>?,
    login: json['login'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'login': instance.login,
      'name': instance.name,
    };
