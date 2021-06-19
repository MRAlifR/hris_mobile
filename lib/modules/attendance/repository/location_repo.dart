import 'package:geolocator/geolocator.dart';

class LocationRepo {
  late bool serviceEnabled;
  late LocationPermission permission;

  Future<void> checkPermission() async {
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

  Stream<Position> getPositionStream({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    int distanceFilter = 0,
    bool forceAndroidLocationManager = false,
    Duration? intervalDuration,
    Duration? timeLimit,
  }) =>
      Geolocator.getPositionStream(
        desiredAccuracy: desiredAccuracy,
        distanceFilter: distanceFilter,
        forceAndroidLocationManager: forceAndroidLocationManager,
        intervalDuration: intervalDuration ?? Duration.zero,
        timeLimit: timeLimit,
      );
}
