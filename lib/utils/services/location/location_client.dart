import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationClient {
  // LocationClient() async {
  //   positionStream = Geolocator.getPositionStream(
  //     intervalDuration: const Duration(seconds: 2),
  //     distanceFilter: 1,
  //   ).listen((event) {
  //     position = event;
  //   });
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // }

  late bool serviceEnabled;
  late LocationPermission permission;

  void checkPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
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

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
