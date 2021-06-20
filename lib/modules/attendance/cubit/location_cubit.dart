import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hris_mobile/modules/attendance/repository/location_repo.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required LocationRepo locationRepo})
      : _locationRepo = locationRepo,
        super(const LocationState.initial()) {
    try {
      _positionStream =
          _locationRepo.getPositionStream().listen((position) async {
        emit(LocationState.changed(
          position: position,
          address: await _locationRepo.getAddress(position),
        ));
      });
    } catch (e) {
      emit(LocationState.failed(e.toString()));
    }
  }

  final LocationRepo _locationRepo;
  late StreamSubscription<Position> _positionStream;

  void emitState() {}

  @override
  Future<void> close() {
    _positionStream.cancel();
    return super.close();
  }
}
