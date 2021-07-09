// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<L, R> with _$Result<L, R> {
  factory Result.success([R? data]) = _Success<L, R>;

  factory Result.failure([L? error]) = _Failure<L, R>;
}
