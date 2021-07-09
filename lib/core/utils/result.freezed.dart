// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  _Success<L, R> success<L, R>([R? data]) {
    return _Success<L, R>(
      data,
    );
  }

  _Failure<L, R> failure<L, R>([L? error]) {
    return _Failure<L, R>(
      error,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<L, R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R? data) success,
    required TResult Function(L? error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R? data)? success,
    TResult Function(L? error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<L, R> value) success,
    required TResult Function(_Failure<L, R> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<L, R> value)? success,
    TResult Function(_Failure<L, R> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<L, R, $Res> {
  factory $ResultCopyWith(
          Result<L, R> value, $Res Function(Result<L, R>) then) =
      _$ResultCopyWithImpl<L, R, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<L, R, $Res> implements $ResultCopyWith<L, R, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<L, R> _value;
  // ignore: unused_field
  final $Res Function(Result<L, R>) _then;
}

/// @nodoc
abstract class _$SuccessCopyWith<L, R, $Res> {
  factory _$SuccessCopyWith(
          _Success<L, R> value, $Res Function(_Success<L, R>) then) =
      __$SuccessCopyWithImpl<L, R, $Res>;
  $Res call({R? data});
}

/// @nodoc
class __$SuccessCopyWithImpl<L, R, $Res>
    extends _$ResultCopyWithImpl<L, R, $Res>
    implements _$SuccessCopyWith<L, R, $Res> {
  __$SuccessCopyWithImpl(
      _Success<L, R> _value, $Res Function(_Success<L, R>) _then)
      : super(_value, (v) => _then(v as _Success<L, R>));

  @override
  _Success<L, R> get _value => super._value as _Success<L, R>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Success<L, R>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as R?,
    ));
  }
}

/// @nodoc

class _$_Success<L, R> implements _Success<L, R> {
  _$_Success([this.data]);

  @override
  final R? data;

  @override
  String toString() {
    return 'Result<$L, $R>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<L, R> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<L, R, _Success<L, R>> get copyWith =>
      __$SuccessCopyWithImpl<L, R, _Success<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R? data) success,
    required TResult Function(L? error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R? data)? success,
    TResult Function(L? error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<L, R> value) success,
    required TResult Function(_Failure<L, R> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<L, R> value)? success,
    TResult Function(_Failure<L, R> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<L, R> implements Result<L, R> {
  factory _Success([R? data]) = _$_Success<L, R>;

  R? get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<L, R, _Success<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<L, R, $Res> {
  factory _$FailureCopyWith(
          _Failure<L, R> value, $Res Function(_Failure<L, R>) then) =
      __$FailureCopyWithImpl<L, R, $Res>;
  $Res call({L? error});
}

/// @nodoc
class __$FailureCopyWithImpl<L, R, $Res>
    extends _$ResultCopyWithImpl<L, R, $Res>
    implements _$FailureCopyWith<L, R, $Res> {
  __$FailureCopyWithImpl(
      _Failure<L, R> _value, $Res Function(_Failure<L, R>) _then)
      : super(_value, (v) => _then(v as _Failure<L, R>));

  @override
  _Failure<L, R> get _value => super._value as _Failure<L, R>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Failure<L, R>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as L?,
    ));
  }
}

/// @nodoc

class _$_Failure<L, R> implements _Failure<L, R> {
  _$_Failure([this.error]);

  @override
  final L? error;

  @override
  String toString() {
    return 'Result<$L, $R>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure<L, R> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<L, R, _Failure<L, R>> get copyWith =>
      __$FailureCopyWithImpl<L, R, _Failure<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R? data) success,
    required TResult Function(L? error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R? data)? success,
    TResult Function(L? error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<L, R> value) success,
    required TResult Function(_Failure<L, R> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<L, R> value)? success,
    TResult Function(_Failure<L, R> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<L, R> implements Result<L, R> {
  factory _Failure([L? error]) = _$_Failure<L, R>;

  L? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FailureCopyWith<L, R, _Failure<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
