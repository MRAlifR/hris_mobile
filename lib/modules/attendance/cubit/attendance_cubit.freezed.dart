// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attendance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendanceStateTearOff {
  const _$AttendanceStateTearOff();

  _AttendanceState call(
      {AttendanceStatus attendanceStatus = AttendanceStatus.checkIn,
      String? currentDate,
      Duration checkInDuration = Duration.zero,
      Duration checkOutDuration = Duration.zero,
      String checkIn = '--:--',
      String checkOut = '--:--',
      String workHour = '--:--'}) {
    return _AttendanceState(
      attendanceStatus: attendanceStatus,
      currentDate: currentDate,
      checkInDuration: checkInDuration,
      checkOutDuration: checkOutDuration,
      checkIn: checkIn,
      checkOut: checkOut,
      workHour: workHour,
    );
  }
}

/// @nodoc
const $AttendanceState = _$AttendanceStateTearOff();

/// @nodoc
mixin _$AttendanceState {
  AttendanceStatus get attendanceStatus => throw _privateConstructorUsedError;
  String? get currentDate => throw _privateConstructorUsedError;
  Duration get checkInDuration => throw _privateConstructorUsedError;
  Duration get checkOutDuration => throw _privateConstructorUsedError;
  String get checkIn => throw _privateConstructorUsedError;
  String get checkOut => throw _privateConstructorUsedError;
  String get workHour => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceStateCopyWith<AttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStateCopyWith<$Res> {
  factory $AttendanceStateCopyWith(
          AttendanceState value, $Res Function(AttendanceState) then) =
      _$AttendanceStateCopyWithImpl<$Res>;
  $Res call(
      {AttendanceStatus attendanceStatus,
      String? currentDate,
      Duration checkInDuration,
      Duration checkOutDuration,
      String checkIn,
      String checkOut,
      String workHour});
}

/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._value, this._then);

  final AttendanceState _value;
  // ignore: unused_field
  final $Res Function(AttendanceState) _then;

  @override
  $Res call({
    Object? attendanceStatus = freezed,
    Object? currentDate = freezed,
    Object? checkInDuration = freezed,
    Object? checkOutDuration = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? workHour = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceStatus: attendanceStatus == freezed
          ? _value.attendanceStatus
          : attendanceStatus // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDuration: checkInDuration == freezed
          ? _value.checkInDuration
          : checkInDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      checkOutDuration: checkOutDuration == freezed
          ? _value.checkOutDuration
          : checkOutDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      checkIn: checkIn == freezed
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      checkOut: checkOut == freezed
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String,
      workHour: workHour == freezed
          ? _value.workHour
          : workHour // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AttendanceStateCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$AttendanceStateCopyWith(
          _AttendanceState value, $Res Function(_AttendanceState) then) =
      __$AttendanceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AttendanceStatus attendanceStatus,
      String? currentDate,
      Duration checkInDuration,
      Duration checkOutDuration,
      String checkIn,
      String checkOut,
      String workHour});
}

/// @nodoc
class __$AttendanceStateCopyWithImpl<$Res>
    extends _$AttendanceStateCopyWithImpl<$Res>
    implements _$AttendanceStateCopyWith<$Res> {
  __$AttendanceStateCopyWithImpl(
      _AttendanceState _value, $Res Function(_AttendanceState) _then)
      : super(_value, (v) => _then(v as _AttendanceState));

  @override
  _AttendanceState get _value => super._value as _AttendanceState;

  @override
  $Res call({
    Object? attendanceStatus = freezed,
    Object? currentDate = freezed,
    Object? checkInDuration = freezed,
    Object? checkOutDuration = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? workHour = freezed,
  }) {
    return _then(_AttendanceState(
      attendanceStatus: attendanceStatus == freezed
          ? _value.attendanceStatus
          : attendanceStatus // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDuration: checkInDuration == freezed
          ? _value.checkInDuration
          : checkInDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      checkOutDuration: checkOutDuration == freezed
          ? _value.checkOutDuration
          : checkOutDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      checkIn: checkIn == freezed
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      checkOut: checkOut == freezed
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String,
      workHour: workHour == freezed
          ? _value.workHour
          : workHour // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AttendanceState implements _AttendanceState {
  const _$_AttendanceState(
      {this.attendanceStatus = AttendanceStatus.checkIn,
      this.currentDate,
      this.checkInDuration = Duration.zero,
      this.checkOutDuration = Duration.zero,
      this.checkIn = '--:--',
      this.checkOut = '--:--',
      this.workHour = '--:--'});

  @JsonKey(defaultValue: AttendanceStatus.checkIn)
  @override
  final AttendanceStatus attendanceStatus;
  @override
  final String? currentDate;
  @JsonKey(defaultValue: Duration.zero)
  @override
  final Duration checkInDuration;
  @JsonKey(defaultValue: Duration.zero)
  @override
  final Duration checkOutDuration;
  @JsonKey(defaultValue: '--:--')
  @override
  final String checkIn;
  @JsonKey(defaultValue: '--:--')
  @override
  final String checkOut;
  @JsonKey(defaultValue: '--:--')
  @override
  final String workHour;

  @override
  String toString() {
    return 'AttendanceState(attendanceStatus: $attendanceStatus, currentDate: $currentDate, checkInDuration: $checkInDuration, checkOutDuration: $checkOutDuration, checkIn: $checkIn, checkOut: $checkOut, workHour: $workHour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AttendanceState &&
            (identical(other.attendanceStatus, attendanceStatus) ||
                const DeepCollectionEquality()
                    .equals(other.attendanceStatus, attendanceStatus)) &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)) &&
            (identical(other.checkInDuration, checkInDuration) ||
                const DeepCollectionEquality()
                    .equals(other.checkInDuration, checkInDuration)) &&
            (identical(other.checkOutDuration, checkOutDuration) ||
                const DeepCollectionEquality()
                    .equals(other.checkOutDuration, checkOutDuration)) &&
            (identical(other.checkIn, checkIn) ||
                const DeepCollectionEquality()
                    .equals(other.checkIn, checkIn)) &&
            (identical(other.checkOut, checkOut) ||
                const DeepCollectionEquality()
                    .equals(other.checkOut, checkOut)) &&
            (identical(other.workHour, workHour) ||
                const DeepCollectionEquality()
                    .equals(other.workHour, workHour)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(attendanceStatus) ^
      const DeepCollectionEquality().hash(currentDate) ^
      const DeepCollectionEquality().hash(checkInDuration) ^
      const DeepCollectionEquality().hash(checkOutDuration) ^
      const DeepCollectionEquality().hash(checkIn) ^
      const DeepCollectionEquality().hash(checkOut) ^
      const DeepCollectionEquality().hash(workHour);

  @JsonKey(ignore: true)
  @override
  _$AttendanceStateCopyWith<_AttendanceState> get copyWith =>
      __$AttendanceStateCopyWithImpl<_AttendanceState>(this, _$identity);
}

abstract class _AttendanceState implements AttendanceState {
  const factory _AttendanceState(
      {AttendanceStatus attendanceStatus,
      String? currentDate,
      Duration checkInDuration,
      Duration checkOutDuration,
      String checkIn,
      String checkOut,
      String workHour}) = _$_AttendanceState;

  @override
  AttendanceStatus get attendanceStatus => throw _privateConstructorUsedError;
  @override
  String? get currentDate => throw _privateConstructorUsedError;
  @override
  Duration get checkInDuration => throw _privateConstructorUsedError;
  @override
  Duration get checkOutDuration => throw _privateConstructorUsedError;
  @override
  String get checkIn => throw _privateConstructorUsedError;
  @override
  String get checkOut => throw _privateConstructorUsedError;
  @override
  String get workHour => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttendanceStateCopyWith<_AttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}
