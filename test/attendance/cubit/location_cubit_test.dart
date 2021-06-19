import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hris_mobile/modules/attendance/cubit/location_cubit.dart';
import 'package:hris_mobile/modules/attendance/repository/location_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockPosition extends Mock implements Position {}

final Position _position = MockPosition();

class MockLocationRepo extends Mock implements LocationRepo {}

class MockGeolocator extends Mock implements Geolocator {}

void main() {
  group('LocationCubit', () {
    late MockLocationRepo locationRepo;

    setUp(() {
      locationRepo = MockLocationRepo();
    });

    blocTest(
        'emits [LocationState.changed(_position)] when LocationCubit initialized',
        build: () {
          when(locationRepo.getPositionStream).thenAnswer((_) {
            return Stream<Position>.fromIterable([_position]);
          });
          return LocationCubit(locationRepo);
        },
        act: (LocationCubit cubit) => cubit.listenPosition(),
        expect: () => [LocationState.changed(_position)],
        verify: (LocationCubit cubit) {
          verify(() => cubit.listenPosition()).called(1);
        });

    tearDown(() {});
  });
}
