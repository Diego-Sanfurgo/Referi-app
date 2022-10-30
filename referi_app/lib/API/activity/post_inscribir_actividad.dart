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
      .post(ActivityUrls.postInscripcion, data: body.toString())
      .then((value) {})
      .onError((error, stackTrace) {})
      .timeout(const Duration(seconds: 40));
}
