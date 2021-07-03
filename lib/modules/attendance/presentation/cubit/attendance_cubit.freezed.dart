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

  _Initial initial({required String currentDate}) {
    return _Initial(
      currentDate: currentDate,
    );
  }

  _CheckIn checkIn(
      {required String currentDate,
      required String checkInAddress,
      required Duration checkInDuration,
      required String checkIn}) {
    return _CheckIn(
      currentDate: currentDate,
      checkInAddress: checkInAddress,
      checkInDuration: checkInDuration,
      checkIn: checkIn,
    );
  }

  _CheckOut checkOut(
      {required String currentDate,
      required String checkInAddress,
      required String checkOutAddress,
      required Duration checkInDuration,
      required Duration checkOutDuration,
      required String checkIn,
      required String checkOut,
      required String workHour}) {
    return _CheckOut(
      currentDate: currentDate,
      checkInAddress: checkInAddress,
      checkOutAddress: checkOutAddress,
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
  String get currentDate => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentDate) initial,
    required TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)
        checkIn,
    required TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)
        checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentDate)? initial,
    TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)?
        checkIn,
    TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)?
        checkOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceStateCopyWith<AttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStateCopyWith<$Res> {
  factory $AttendanceStateCopyWith(
          AttendanceState value, $Res Function(AttendanceState) then) =
      _$AttendanceStateCopyWithImpl<$Res>;
  $Res call({String currentDate});
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
    Object? currentDate = freezed,
  }) {
    return _then(_value.copyWith(
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({String currentDate});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AttendanceStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? currentDate = freezed,
  }) {
    return _then(_Initial(
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.currentDate});

  @override
  final String currentDate;

  @override
  String toString() {
    return 'AttendanceState.initial(currentDate: $currentDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentDate);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentDate) initial,
    required TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)
        checkIn,
    required TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)
        checkOut,
  }) {
    return initial(currentDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentDate)? initial,
    TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)?
        checkIn,
    TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)?
        checkOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currentDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AttendanceState {
  const factory _Initial({required String currentDate}) = _$_Initial;

  @override
  String get currentDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CheckInCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$CheckInCopyWith(_CheckIn value, $Res Function(_CheckIn) then) =
      __$CheckInCopyWithImpl<$Res>;
  @override
  $Res call(
      {String currentDate,
      String checkInAddress,
      Duration checkInDuration,
      String checkIn});
}

/// @nodoc
class __$CheckInCopyWithImpl<$Res> extends _$AttendanceStateCopyWithImpl<$Res>
    implements _$CheckInCopyWith<$Res> {
  __$CheckInCopyWithImpl(_CheckIn _value, $Res Function(_CheckIn) _then)
      : super(_value, (v) => _then(v as _CheckIn));

  @override
  _CheckIn get _value => super._value as _CheckIn;

  @override
  $Res call({
    Object? currentDate = freezed,
    Object? checkInAddress = freezed,
    Object? checkInDuration = freezed,
    Object? checkIn = freezed,
  }) {
    return _then(_CheckIn(
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
      checkInAddress: checkInAddress == freezed
          ? _value.checkInAddress
          : checkInAddress // ignore: cast_nullable_to_non_nullable
              as String,
      checkInDuration: checkInDuration == freezed
          ? _value.checkInDuration
          : checkInDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      checkIn: checkIn == freezed
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckIn implements _CheckIn {
  const _$_CheckIn(
      {required this.currentDate,
      required this.checkInAddress,
      required this.checkInDuration,
      required this.checkIn});

  @override
  final String currentDate;
  @override
  final String checkInAddress;
  @override
  final Duration checkInDuration;
  @override
  final String checkIn;

  @override
  String toString() {
    return 'AttendanceState.checkIn(currentDate: $currentDate, checkInAddress: $checkInAddress, checkInDuration: $checkInDuration, checkIn: $checkIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckIn &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)) &&
            (identical(other.checkInAddress, checkInAddress) ||
                const DeepCollectionEquality()
                    .equals(other.checkInAddress, checkInAddress)) &&
            (identical(other.checkInDuration, checkInDuration) ||
                const DeepCollectionEquality()
                    .equals(other.checkInDuration, checkInDuration)) &&
            (identical(other.checkIn, checkIn) ||
                const DeepCollectionEquality().equals(other.checkIn, checkIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentDate) ^
      const DeepCollectionEquality().hash(checkInAddress) ^
      const DeepCollectionEquality().hash(checkInDuration) ^
      const DeepCollectionEquality().hash(checkIn);

  @JsonKey(ignore: true)
  @override
  _$CheckInCopyWith<_CheckIn> get copyWith =>
      __$CheckInCopyWithImpl<_CheckIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentDate) initial,
    required TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)
        checkIn,
    required TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)
        checkOut,
  }) {
    return checkIn(currentDate, checkInAddress, checkInDuration, this.checkIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentDate)? initial,
    TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)?
        checkIn,
    TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)?
        checkOut,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(
          currentDate, checkInAddress, checkInDuration, this.checkIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return checkIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(this);
    }
    return orElse();
  }
}

abstract class _CheckIn implements AttendanceState {
  const factory _CheckIn(
      {required String currentDate,
      required String checkInAddress,
      required Duration checkInDuration,
      required String checkIn}) = _$_CheckIn;

  @override
  String get currentDate => throw _privateConstructorUsedError;
  String get checkInAddress => throw _privateConstructorUsedError;
  Duration get checkInDuration => throw _privateConstructorUsedError;
  String get checkIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckInCopyWith<_CheckIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CheckOutCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$CheckOutCopyWith(_CheckOut value, $Res Function(_CheckOut) then) =
      __$CheckOutCopyWithImpl<$Res>;
  @override
  $Res call(
      {String currentDate,
      String checkInAddress,
      String checkOutAddress,
      Duration checkInDuration,
      Duration checkOutDuration,
      String checkIn,
      String checkOut,
      String workHour});
}

/// @nodoc
class __$CheckOutCopyWithImpl<$Res> extends _$AttendanceStateCopyWithImpl<$Res>
    implements _$CheckOutCopyWith<$Res> {
  __$CheckOutCopyWithImpl(_CheckOut _value, $Res Function(_CheckOut) _then)
      : super(_value, (v) => _then(v as _CheckOut));

  @override
  _CheckOut get _value => super._value as _CheckOut;

  @override
  $Res call({
    Object? currentDate = freezed,
    Object? checkInAddress = freezed,
    Object? checkOutAddress = freezed,
    Object? checkInDuration = freezed,
    Object? checkOutDuration = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? workHour = freezed,
  }) {
    return _then(_CheckOut(
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String,
      checkInAddress: checkInAddress == freezed
          ? _value.checkInAddress
          : checkInAddress // ignore: cast_nullable_to_non_nullable
              as String,
      checkOutAddress: checkOutAddress == freezed
          ? _value.checkOutAddress
          : checkOutAddress // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_CheckOut implements _CheckOut {
  const _$_CheckOut(
      {required this.currentDate,
      required this.checkInAddress,
      required this.checkOutAddress,
      required this.checkInDuration,
      required this.checkOutDuration,
      required this.checkIn,
      required this.checkOut,
      required this.workHour});

  @override
  final String currentDate;
  @override
  final String checkInAddress;
  @override
  final String checkOutAddress;
  @override
  final Duration checkInDuration;
  @override
  final Duration checkOutDuration;
  @override
  final String checkIn;
  @override
  final String checkOut;
  @override
  final String workHour;

  @override
  String toString() {
    return 'AttendanceState.checkOut(currentDate: $currentDate, checkInAddress: $checkInAddress, checkOutAddress: $checkOutAddress, checkInDuration: $checkInDuration, checkOutDuration: $checkOutDuration, checkIn: $checkIn, checkOut: $checkOut, workHour: $workHour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CheckOut &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)) &&
            (identical(other.checkInAddress, checkInAddress) ||
                const DeepCollectionEquality()
                    .equals(other.checkInAddress, checkInAddress)) &&
            (identical(other.checkOutAddress, checkOutAddress) ||
                const DeepCollectionEquality()
                    .equals(other.checkOutAddress, checkOutAddress)) &&
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
      const DeepCollectionEquality().hash(currentDate) ^
      const DeepCollectionEquality().hash(checkInAddress) ^
      const DeepCollectionEquality().hash(checkOutAddress) ^
      const DeepCollectionEquality().hash(checkInDuration) ^
      const DeepCollectionEquality().hash(checkOutDuration) ^
      const DeepCollectionEquality().hash(checkIn) ^
      const DeepCollectionEquality().hash(checkOut) ^
      const DeepCollectionEquality().hash(workHour);

  @JsonKey(ignore: true)
  @override
  _$CheckOutCopyWith<_CheckOut> get copyWith =>
      __$CheckOutCopyWithImpl<_CheckOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentDate) initial,
    required TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)
        checkIn,
    required TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)
        checkOut,
  }) {
    return checkOut(
        currentDate,
        checkInAddress,
        checkOutAddress,
        checkInDuration,
        checkOutDuration,
        this.checkIn,
        this.checkOut,
        workHour);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentDate)? initial,
    TResult Function(String currentDate, String checkInAddress,
            Duration checkInDuration, String checkIn)?
        checkIn,
    TResult Function(
            String currentDate,
            String checkInAddress,
            String checkOutAddress,
            Duration checkInDuration,
            Duration checkOutDuration,
            String checkIn,
            String checkOut,
            String workHour)?
        checkOut,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(
          currentDate,
          checkInAddress,
          checkOutAddress,
          checkInDuration,
          checkOutDuration,
          this.checkIn,
          this.checkOut,
          workHour);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return checkOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(this);
    }
    return orElse();
  }
}

abstract class _CheckOut implements AttendanceState {
  const factory _CheckOut(
      {required String currentDate,
      required String checkInAddress,
      required String checkOutAddress,
      required Duration checkInDuration,
      required Duration checkOutDuration,
      required String checkIn,
      required String checkOut,
      required String workHour}) = _$_CheckOut;

  @override
  String get currentDate => throw _privateConstructorUsedError;
  String get checkInAddress => throw _privateConstructorUsedError;
  String get checkOutAddress => throw _privateConstructorUsedError;
  Duration get checkInDuration => throw _privateConstructorUsedError;
  Duration get checkOutDuration => throw _privateConstructorUsedError;
  String get checkIn => throw _privateConstructorUsedError;
  String get checkOut => throw _privateConstructorUsedError;
  String get workHour => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckOutCopyWith<_CheckOut> get copyWith =>
      throw _privateConstructorUsedError;
}
