import 'package:geolocator/geolocator.dart';
class Location {
  double? latitude;
  double? longitide;
  String? apiKey = 'your API key';
  int? status;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
      print(latitude);
      print(longitide);
    } catch (e) {
      print(e);
    }
  }
}