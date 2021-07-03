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

  Success<L, R> success<L, R>(R data) {
    return Success<L, R>(
      data,
    );
  }

  Failure<L, R> failure<L, R>(L error) {
    return Failure<L, R>(
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
    required TResult Function(R data) success,
    required TResult Function(L error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R data)? success,
    TResult Function(L error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<L, R> value) success,
    required TResult Function(Failure<L, R> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<L, R> value)? success,
    TResult Function(Failure<L, R> value)? failure,
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
abstract class $SuccessCopyWith<L, R, $Res> {
  factory $SuccessCopyWith(
          Success<L, R> value, $Res Function(Success<L, R>) then) =
      _$SuccessCopyWithImpl<L, R, $Res>;
  $Res call({R data});
}

/// @nodoc
class _$SuccessCopyWithImpl<L, R, $Res> extends _$ResultCopyWithImpl<L, R, $Res>
    implements $SuccessCopyWith<L, R, $Res> {
  _$SuccessCopyWithImpl(
      Success<L, R> _value, $Res Function(Success<L, R>) _then)
      : super(_value, (v) => _then(v as Success<L, R>));

  @override
  Success<L, R> get _value => super._value as Success<L, R>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<L, R>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$Success<L, R> implements Success<L, R> {
  _$Success(this.data);

  @override
  final R data;

  @override
  String toString() {
    return 'Result<$L, $R>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<L, R> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<L, R, Success<L, R>> get copyWith =>
      _$SuccessCopyWithImpl<L, R, Success<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R data) success,
    required TResult Function(L error) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R data)? success,
    TResult Function(L error)? failure,
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
    required TResult Function(Success<L, R> value) success,
    required TResult Function(Failure<L, R> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<L, R> value)? success,
    TResult Function(Failure<L, R> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<L, R> implements Result<L, R> {
  factory Success(R data) = _$Success<L, R>;

  R get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<L, R, Success<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<L, R, $Res> {
  factory $FailureCopyWith(
          Failure<L, R> value, $Res Function(Failure<L, R>) then) =
      _$FailureCopyWithImpl<L, R, $Res>;
  $Res call({L error});
}

/// @nodoc
class _$FailureCopyWithImpl<L, R, $Res> extends _$ResultCopyWithImpl<L, R, $Res>
    implements $FailureCopyWith<L, R, $Res> {
  _$FailureCopyWithImpl(
      Failure<L, R> _value, $Res Function(Failure<L, R>) _then)
      : super(_value, (v) => _then(v as Failure<L, R>));

  @override
  Failure<L, R> get _value => super._value as Failure<L, R>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Failure<L, R>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as L,
    ));
  }
}

/// @nodoc

class _$Failure<L, R> implements Failure<L, R> {
  _$Failure(this.error);

  @override
  final L error;

  @override
  String toString() {
    return 'Result<$L, $R>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure<L, R> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<L, R, Failure<L, R>> get copyWith =>
      _$FailureCopyWithImpl<L, R, Failure<L, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R data) success,
    required TResult Function(L error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R data)? success,
    TResult Function(L error)? failure,
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
    required TResult Function(Success<L, R> value) success,
    required TResult Function(Failure<L, R> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<L, R> value)? success,
    TResult Function(Failure<L, R> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<L, R> implements Result<L, R> {
  factory Failure(L error) = _$Failure<L, R>;

  L get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<L, R, Failure<L, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
