import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<L, R> with _$Result<L, R> {
  factory Result.success(R data) = Success<L, R>;

  factory Result.failure(L error) = Failure<L, R>;
}
