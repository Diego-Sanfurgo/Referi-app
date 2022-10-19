import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future postInscribirActividad() async {
  Dio dio = Dio();

  Map body = {
    "idSocio": "string",
    "idActividad": "string",
    "idOrganizacion": "string"
  };

  await dio
      .post(ActivityUrls.postInscripcion)
      .then((value) {})
      .onError((error, stackTrace) {})
      .timeout(Duration(seconds: 40));
}
