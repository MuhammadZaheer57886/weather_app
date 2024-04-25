import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Import the geocoding package

class LocationService {
  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions denied');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> getCityNameFromLatLng(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks.isNotEmpty
        ? placemarks.first.locality ?? 'Unknown City'
        : 'Unable to get city name';
  }

}
