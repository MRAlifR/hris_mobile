import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({this.id, this.employeeId, this.login, this.name});

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  static const model = 'res.users';
  static const fields = ['id', 'employee_id', 'login', 'name'];

  int? id;
  @JsonKey(name: 'employee_id')
  List<dynamic>? employeeId;
  String? login;
  String? name;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, employeeId: $employeeId, login: $login, name: $name}';
  }
}
