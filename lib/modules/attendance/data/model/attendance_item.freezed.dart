// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attendance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendanceItemTearOff {
  const _$AttendanceItemTearOff();

  _AttendanceItem call(List<Attendance> attendances) {
    return _AttendanceItem(
      attendances,
    );
  }
}

/// @nodoc
const $AttendanceItem = _$AttendanceItemTearOff();

/// @nodoc
mixin _$AttendanceItem {
  List<Attendance> get attendances => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceItemCopyWith<AttendanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceItemCopyWith<$Res> {
  factory $AttendanceItemCopyWith(
          AttendanceItem value, $Res Function(AttendanceItem) then) =
      _$AttendanceItemCopyWithImpl<$Res>;
  $Res call({List<Attendance> attendances});
}

/// @nodoc
class _$AttendanceItemCopyWithImpl<$Res>
    implements $AttendanceItemCopyWith<$Res> {
  _$AttendanceItemCopyWithImpl(this._value, this._then);

  final AttendanceItem _value;
  // ignore: unused_field
  final $Res Function(AttendanceItem) _then;

  @override
  $Res call({
    Object? attendances = freezed,
  }) {
    return _then(_value.copyWith(
      attendances: attendances == freezed
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ));
  }
}

/// @nodoc
abstract class _$AttendanceItemCopyWith<$Res>
    implements $AttendanceItemCopyWith<$Res> {
  factory _$AttendanceItemCopyWith(
          _AttendanceItem value, $Res Function(_AttendanceItem) then) =
      __$AttendanceItemCopyWithImpl<$Res>;
  @override
  $Res call({List<Attendance> attendances});
}

/// @nodoc
class __$AttendanceItemCopyWithImpl<$Res>
    extends _$AttendanceItemCopyWithImpl<$Res>
    implements _$AttendanceItemCopyWith<$Res> {
  __$AttendanceItemCopyWithImpl(
      _AttendanceItem _value, $Res Function(_AttendanceItem) _then)
      : super(_value, (v) => _then(v as _AttendanceItem));

  @override
  _AttendanceItem get _value => super._value as _AttendanceItem;

  @override
  $Res call({
    Object? attendances = freezed,
  }) {
    return _then(_AttendanceItem(
      attendances == freezed
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ));
  }
}

/// @nodoc

class _$_AttendanceItem extends _AttendanceItem {
  const _$_AttendanceItem(this.attendances) : super._();

  @override
  final List<Attendance> attendances;

  @override
  String toString() {
    return 'AttendanceItem(attendances: $attendances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AttendanceItem &&
            (identical(other.attendances, attendances) ||
                const DeepCollectionEquality()
                    .equals(other.attendances, attendances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(attendances);

  @JsonKey(ignore: true)
  @override
  _$AttendanceItemCopyWith<_AttendanceItem> get copyWith =>
      __$AttendanceItemCopyWithImpl<_AttendanceItem>(this, _$identity);
}

abstract class _AttendanceItem extends AttendanceItem {
  const factory _AttendanceItem(List<Attendance> attendances) =
      _$_AttendanceItem;
  const _AttendanceItem._() : super._();

  @override
  List<Attendance> get attendances => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttendanceItemCopyWith<_AttendanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}
