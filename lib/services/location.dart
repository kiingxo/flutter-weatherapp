import 'package:geolocator/geolocator.dart';
//using the geolocator package to get current use location
class Location {
  late double lat;
  late double long;
  late double position;
  //the logic for getting the current user location
  Future<void> getuserLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;

      //catch exemptions that might cause an error such as if user denies permission access
    } catch (e) {
      print(e);
    }
  }
}
