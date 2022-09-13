import 'package:location/location.dart';
import 'package:referi_app/models/local_geolocation.dart';

import '../API/location/get_local_geolocation.dart';
import '../API/location/location.dart';

class LocationHandler {
  static Future<LocationData?> getActualLocation() async {
    return await getLocation();
  }

  static Future<LocalGeolocation?> getLocal() async {
    return await getLocalGeolocation();
  }
}
