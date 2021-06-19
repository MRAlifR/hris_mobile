import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hris_mobile/modules/attendance/repository/location_repo.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepo) : super(const LocationState.initial());

  late LocationRepo locationRepo;
  late Geolocator geolocator;
  late StreamSubscription<Position> positionStream;

  void listenPosition() {
    try {
      positionStream = locationRepo
          .getPositionStream(
        intervalDuration: const Duration(seconds: 2),
        distanceFilter: 1,
      )
          .listen((position) {
        emit(LocationState.changed(position));
      });
    } catch (e) {
      emit(LocationState.failed(e.toString()));
    }
  }

  @override
  Future<void> close() {
    positionStream.cancel();
    return super.close();
  }
}
