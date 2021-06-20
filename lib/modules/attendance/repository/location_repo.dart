import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:supercharged/supercharged.dart';

class LocationRepo {
  static const _intervalDuration = Duration(seconds: 5);
  late bool serviceEnabled;
  late LocationPermission permission;

  Future<void> _checkPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
  }

  Future<String> getAddress(Position position) async {
    var placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    var buildings = placemarks.where((placemark) => placemark.name!.length > 5);

    if (buildings.isEmpty) {
      var placemark = placemarks.pickOne();
      // ignore: lines_longer_than_80_chars
      return '${placemark.name}, ${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}';
    } else {
      var placemark = buildings.pickOne();
      // ignore: lines_longer_than_80_chars
      return '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}';
    }
  }

  Stream<Position> getPositionStream({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    int distanceFilter = 0,
    bool forceAndroidLocationManager = false,
    Duration? intervalDuration,
    Duration? timeLimit,
  }) {
    _checkPermission();
    return Geolocator.getPositionStream(
      desiredAccuracy: desiredAccuracy,
      distanceFilter: distanceFilter,
      forceAndroidLocationManager: forceAndroidLocationManager,
      intervalDuration: intervalDuration ?? _intervalDuration,
      timeLimit: timeLimit,
    );
  }
}
