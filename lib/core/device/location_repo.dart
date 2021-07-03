import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:supercharged/supercharged.dart';

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

  Future<String> getAddress(Position position) async {
    var placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    var placemark = placemarks.pickOne();
    // ignore: lines_longer_than_80_chars
    return '${placemark.name}, ${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}';
  }

  Stream<Position> getPositionStream({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    int distanceFilter = 0,
    bool forceAndroidLocationManager = false,
    Duration? intervalDuration = const Duration(seconds: 5),
    Duration? timeLimit,
  }) {
    checkPermission();
    return Geolocator.getPositionStream(
      desiredAccuracy: desiredAccuracy,
      distanceFilter: distanceFilter,
      forceAndroidLocationManager: forceAndroidLocationManager,
      intervalDuration: intervalDuration,
      timeLimit: timeLimit,
    );
  }
}
