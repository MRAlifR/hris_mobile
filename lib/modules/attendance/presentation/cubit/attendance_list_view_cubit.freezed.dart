// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attendance_list_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendanceListViewStateTearOff {
  const _$AttendanceListViewStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Failed failed(String message) {
    return _Failed(
      message,
    );
  }

  _Loading loading({required DateTime dateTime}) {
    return _Loading(
      dateTime: dateTime,
    );
  }

  _NoData noData({required DateTime dateTime}) {
    return _NoData(
      dateTime: dateTime,
    );
  }

  _Success success(
      {required DateTime dateTime, required List<AttendanceItem> attendances}) {
    return _Success(
      dateTime: dateTime,
      attendances: attendances,
    );
  }
}

/// @nodoc
const $AttendanceListViewState = _$AttendanceListViewStateTearOff();

/// @nodoc
mixin _$AttendanceListViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceListViewStateCopyWith<$Res> {
  factory $AttendanceListViewStateCopyWith(AttendanceListViewState value,
          $Res Function(AttendanceListViewState) then) =
      _$AttendanceListViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AttendanceListViewStateCopyWithImpl<$Res>
    implements $AttendanceListViewStateCopyWith<$Res> {
  _$AttendanceListViewStateCopyWithImpl(this._value, this._then);

  final AttendanceListViewState _value;
  // ignore: unused_field
  final $Res Function(AttendanceListViewState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AttendanceListViewStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceListViewState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceListViewState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AttendanceListViewState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res>
    extends _$AttendanceListViewStateCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(_Failed _value, $Res Function(_Failed) _then)
      : super(_value, (v) => _then(v as _Failed));

  @override
  _Failed get _value => super._value as _Failed;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Failed(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failed with DiagnosticableTreeMixin implements _Failed {
  const _$_Failed(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceListViewState.failed(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceListViewState.failed'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failed &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AttendanceListViewState {
  const factory _Failed(String message) = _$_Failed;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$AttendanceListViewStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_Loading(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading({required this.dateTime});

  @override
  final DateTime dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceListViewState.loading(dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceListViewState.loading'))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) {
    return loading(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AttendanceListViewState {
  const factory _Loading({required DateTime dateTime}) = _$_Loading;

  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoDataCopyWith<$Res> {
  factory _$NoDataCopyWith(_NoData value, $Res Function(_NoData) then) =
      __$NoDataCopyWithImpl<$Res>;
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$NoDataCopyWithImpl<$Res>
    extends _$AttendanceListViewStateCopyWithImpl<$Res>
    implements _$NoDataCopyWith<$Res> {
  __$NoDataCopyWithImpl(_NoData _value, $Res Function(_NoData) _then)
      : super(_value, (v) => _then(v as _NoData));

  @override
  _NoData get _value => super._value as _NoData;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_NoData(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_NoData with DiagnosticableTreeMixin implements _NoData {
  const _$_NoData({required this.dateTime});

  @override
  final DateTime dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceListViewState.noData(dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceListViewState.noData'))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoData &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  _$NoDataCopyWith<_NoData> get copyWith =>
      __$NoDataCopyWithImpl<_NoData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) {
    return noData(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class _NoData implements AttendanceListViewState {
  const factory _NoData({required DateTime dateTime}) = _$_NoData;

  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NoDataCopyWith<_NoData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({DateTime dateTime, List<AttendanceItem> attendances});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$AttendanceListViewStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_Success(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attendances: attendances == freezed
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceItem>,
    ));
  }
}

/// @nodoc

class _$_Success with DiagnosticableTreeMixin implements _Success {
  const _$_Success({required this.dateTime, required this.attendances});

  @override
  final DateTime dateTime;
  @override
  final List<AttendanceItem> attendances;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceListViewState.success(dateTime: $dateTime, attendances: $attendances)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceListViewState.success'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('attendances', attendances));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.attendances, attendances) ||
                const DeepCollectionEquality()
                    .equals(other.attendances, attendances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(attendances);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) failed,
    required TResult Function(DateTime dateTime) loading,
    required TResult Function(DateTime dateTime) noData,
    required TResult Function(
            DateTime dateTime, List<AttendanceItem> attendances)
        success,
  }) {
    return success(dateTime, attendances);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? failed,
    TResult Function(DateTime dateTime)? loading,
    TResult Function(DateTime dateTime)? noData,
    TResult Function(DateTime dateTime, List<AttendanceItem> attendances)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(dateTime, attendances);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoData value) noData,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failed value)? failed,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoData value)? noData,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AttendanceListViewState {
  const factory _Success(
      {required DateTime dateTime,
      required List<AttendanceItem> attendances}) = _$_Success;

  DateTime get dateTime => throw _privateConstructorUsedError;
  List<AttendanceItem> get attendances => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
