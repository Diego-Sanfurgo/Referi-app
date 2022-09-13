import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/handlers/location_handler.dart';
import 'package:referi_app/models/local_geolocation.dart';

Future<LocalGeolocation?> getLocalGeolocation() async {
  Dio dio = Dio();

  LocationData? actualLocation = await LocationHandler.getActualLocation();
  if (actualLocation == null) {
    return null;
  }
  final double lat = actualLocation.latitude!;
  final double lon = actualLocation.longitude!;

  String url = "${LocationUrls.getLocalGeolocation}lat=$lat&lon=$lon";

  return await dio.get(url).then((value) {
    if (value.statusCode == 200) {
      return LocalGeolocation.fromJson(value.data);
    }
  }).onError((error, stackTrace) => null);
}
