part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.changed({
    required Position position,
    required String address,
  }) = Changed;
  const factory LocationState.failed(String message) = Failed;
}
