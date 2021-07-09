// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'month_selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MonthSelectionStateTearOff {
  const _$MonthSelectionStateTearOff();

  _MonthSelectionState call(DateTime dateTime) {
    return _MonthSelectionState(
      dateTime,
    );
  }
}

/// @nodoc
const $MonthSelectionState = _$MonthSelectionStateTearOff();

/// @nodoc
mixin _$MonthSelectionState {
  DateTime get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthSelectionStateCopyWith<MonthSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthSelectionStateCopyWith<$Res> {
  factory $MonthSelectionStateCopyWith(
          MonthSelectionState value, $Res Function(MonthSelectionState) then) =
      _$MonthSelectionStateCopyWithImpl<$Res>;
  $Res call({DateTime dateTime});
}

/// @nodoc
class _$MonthSelectionStateCopyWithImpl<$Res>
    implements $MonthSelectionStateCopyWith<$Res> {
  _$MonthSelectionStateCopyWithImpl(this._value, this._then);

  final MonthSelectionState _value;
  // ignore: unused_field
  final $Res Function(MonthSelectionState) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MonthSelectionStateCopyWith<$Res>
    implements $MonthSelectionStateCopyWith<$Res> {
  factory _$MonthSelectionStateCopyWith(_MonthSelectionState value,
          $Res Function(_MonthSelectionState) then) =
      __$MonthSelectionStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$MonthSelectionStateCopyWithImpl<$Res>
    extends _$MonthSelectionStateCopyWithImpl<$Res>
    implements _$MonthSelectionStateCopyWith<$Res> {
  __$MonthSelectionStateCopyWithImpl(
      _MonthSelectionState _value, $Res Function(_MonthSelectionState) _then)
      : super(_value, (v) => _then(v as _MonthSelectionState));

  @override
  _MonthSelectionState get _value => super._value as _MonthSelectionState;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_MonthSelectionState(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_MonthSelectionState implements _MonthSelectionState {
  const _$_MonthSelectionState(this.dateTime);

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'MonthSelectionState(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MonthSelectionState &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  _$MonthSelectionStateCopyWith<_MonthSelectionState> get copyWith =>
      __$MonthSelectionStateCopyWithImpl<_MonthSelectionState>(
          this, _$identity);
}

abstract class _MonthSelectionState implements MonthSelectionState {
  const factory _MonthSelectionState(DateTime dateTime) =
      _$_MonthSelectionState;

  @override
  DateTime get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MonthSelectionStateCopyWith<_MonthSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
