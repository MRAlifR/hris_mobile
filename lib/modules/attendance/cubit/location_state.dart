part of 'location_cubit.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.changed(Position position) = Changed;
  const factory LocationState.failed(String message) = Failed;
}
